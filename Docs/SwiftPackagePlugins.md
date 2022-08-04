# Swift Package Plugins

Plugins were introduced for Swift Package Manager in Swift 5.6 (Xcode 13.4) and they have great potential to streamline your developer experience.

If you are new to Plugins, be sure to check out some more general introductions from the resources below:

- [Meet Swift Package plugins - Apple WWDC 2022](https://developer.apple.com/videos/play/wwdc2022/110359/)
- [Create Swift Package plugins - Apple WWDC 2022](https://developer.apple.com/videos/play/wwdc2022/110401/)

If you want to learn how to use Swift Package plugins with CreateAPI, we've explored use cases with both Command and Build Tool plugins.

> **Warning**: Plugins are a new concept, and we're still learning about them ourself. Expect this documentation to change frequently so be sure to check back for new best practices.

## Depending on `create-api`

While there are different types of plugins, you are always going to need the `create-api` cli as a dependency.

You can do this by adding the CreateAPI package as a dependency just like you would with any other library but this means that you need to compile it each time, which isn't ideal.

Instead, you can add your own target that links to our published Artifact Bundle to bring in a precompiled version of the tool.

> **Note**: Currently, our Artifact Bundle only includes the precompiled binary for macOS meaning that there is no Linux support.

To add a new `binaryTarget` to your package, you need two pieces of information:

1. The url to the artifact bundle
2. The checksum of the bundle

You can find all of this in the [release notes](https://github.com/CreateAPI/CreateAPI/releases/latest).

In your **Package.swift**, add the following to your `targets` array:

```swift
.binaryTarget(
    name: "create-api",
    url: "https://github.com/CreateAPI/CreateAPI/releases/download/x.x.x/create-api.artifactbundle.zip",
    checksum: "ffffffffff"
)
```

Replace the `url` and `checksum` with the values for the release of your choice.

## Writing a Plugin

- [Command Plugin](#command-plugin)
- [Build Tool Plugin](#build-tool-plugin)

### Command Plugin

A command plugin can be invoked on demand via the `swift package` command.

Depending on your usage, you might then write a plugin that just invokes the `create-api` cli with the appropriate options and arguments, or you might do something more complex like invoke the command multiple times for multiple different modules. It's entirely up to you.

Below is a basic example of a `CommandPlugin`:

**Plugins/GenerateAPI/Plugin.swift**
```swift
import Foundation
import PackagePlugin

@main
struct Plugin: CommandPlugin {
    func performCommand(context: PluginContext, arguments: [String]) async throws {
        let createAPI = try context.tool(named: "create-api")
        let workingDirectory = context.package.directory.appending("Sources", "MyAPI")

        let process = Process()
        process.currentDirectoryURL = URL(fileURLWithPath: workingDirectory.string)
        process.executableURL = URL(fileURLWithPath: createAPI.path.string)
        process.arguments = [
            "generate",
            "schema.json",
            "--module", "MyAPI",
            "--output", ".",
            "--config", ".create-api.yml",
            "--split"
        ]

        try process.run()
        process.waitUntilExit()
    }
}
```

**Package.swift**
```swift
// swift-tools-version:5.6
import PackageDescription

let package = Package(
    name: "MyPackage",
    platforms: [.iOS(.v13), .macOS(.v10_15)],
    products: [.library(name: "MyAPI", targets: ["MyAPI"])],
    dependencies: [
        // ...
    ],
    targets: [
        .target(
            name: "MyAPI",
            exclude: ["schema.json", ".create-api.yml"]
        ),
        .binaryTarget(
            name: "create-api",
            url: "https://github.com/CreateAPI/CreateAPI/releases/download/0.0.5/create-api.artifactbundle.zip",
            checksum: "89c75ec3b2938d08b961b94e70e6dd6fa0ff52a90037304d41718cd5fb58bd24"
        ),
        .plugin(
            name: "CreateAPI",
            capability: .command(
                intent: .custom(
                    verb: "generate-api",
                    description: "Generates the OpenAPI entities and paths using CreateAPI"
                ),
                permissions: [
                    .writeToPackageDirectory(reason: "To output the generated source code")
                ]
            ),
            dependencies: [
                .target(name: "create-api")
            ]
        )
    ]
)
```

 You could then invoke the plugin like so:

```bash
$ swift package --allow-writing-to-package-directory generate-api
```

In the above example, the plugin will call `create-api generate` within the **Sources/MyAPI/** directory where it loads the **schema.json** and **.create-api.yml** files and outputs the sources inline. You can then review the output and commit them etc.

### Build Tool Plugin

A build tool plugin works slightly differently. Instead of manually running it through the `swift package` command, its run as part of the build process meaning that you can do things such as generate the source code only when required and avoid having to check it into source control.

Below is a basic example of a `BuildToolPlugin`:

**Plugins/GenerateAPI/Plugin.swift**
```swift
import Foundation
import PackagePlugin

@main
struct Plugin: BuildToolPlugin {
    func createBuildCommands(context: PluginContext, target: Target) async throws -> [Command] {
        let schema = context.package.directory.appending("schema.yml")
        let config = context.package.directory.appending(".create-api.yml")
        let output = context.pluginWorkDirectory

        return [
            .buildCommand(
                displayName: "Generating API",
                executable: try context.tool(named: "create-api").path,
                arguments: [
                    "generate",
                    "--module", target.name,
                    "--config", config,
                    "--output", output,
                    "--no-split",
                    schema
                ],
                inputFiles: [
                    schema,
                    config
                ],
                outputFiles: [
                    output.appending("Paths.swift"),
                    output.appending("Entities.swift")
                ]
            )
        ]
    }
}
```

**Package.swift**
```swift
// swift-tools-version: 5.6
import PackageDescription

let package = Package(
    name: "MyPackage",
    platforms: [.iOS(.v13), .macOS(.v10_15)],
    products: [.library(name: "MyAPI", targets: ["MyAPI"])],
    dependencies: [
        // ...
    ],
    targets: [
        .target(
            name: "MyAPI",
            dependencies: [
                .target(name: "GenerateAPI"),
                // ...
            ]
        ),
        .binaryTarget(
            name: "create-api",
            url: "https://github.com/CreateAPI/CreateAPI/releases/download/0.0.5/create-api.artifactbundle.zip",
            checksum: "89c75ec3b2938d08b961b94e70e6dd6fa0ff52a90037304d41718cd5fb58bd24"
        ),
        .plugin(
            name: "GenerateAPI",
            capability: .buildTool(),
            dependencies: [
                .target(name: "create-api")
            ]
        )
    ]
)
```

While there are some similarities to command plugins, the build tool plugin is marked as a dependency to the relevant target (`MyAPI`) and the plugin returns a build command provides to the build system so that it can determine if it needs to run or not. It does this by checking both the defined `inputs` and `outputs`. It the outputs are missing, or the inputs have changed, it'll run the `create-api generate` command and write the outputs into `pluginWorkDirectory`.

This is powerful, because it enables you to modify the schema or configuration file inside Xcode, hit <kbd>⌘</kbd> + <kbd>B</kbd> and see your changes reflected instantaneously. It does however have some downsides because it is not easy to find the generated sources and can make debugging schema/generation issues tricker.
