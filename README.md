<img width="80px" src="https://user-images.githubusercontent.com/1567433/146774765-4671c989-62c3-4418-8bdb-2773d7a26067.png">

# Create API

Delightful code generation for OpenAPI specs for Swift written in Swift.

- **Fast**: processes specs with 100K lines of YAML in less than a second
- **Smart**: generates Swift code that looks like it's carefully written by hand
- **Reliable**: tested on 1KK lines of publicly available OpenAPI specs producing correct code every time
- **Customizable**: offers a ton of customization options

> Powered by [OpenAPIKit](https://github.com/mattpolzin/OpenAPIKit)

## Installation

### [Mint](https://github.com/yonaskolb/Mint)

```bash
$ mint install CreateAPI/CreateAPI
```

### [Homebrew](https://formulae.brew.sh/formula/create-api)

```bash
$ brew install create-api
```

### Swift Package Plugins

- [Creating a Swift Package Plugin](./Docs/SwiftPackagePlugins.md)

### Make

```bash
$ git clone https://github.com/CreateAPI/CreateAPI.git
$ cd CreateAPI
$ make install
```

## Getting Started

You'll need an [OpenAPI schema](https://swagger.io/specification/) (using 3.0.x) for your API. If your schema has external references, you might also need to bundle it beforehand.

If you have never used CreateAPI before, be sure to check out our tutorial: [Generating an API with CreateAPI](./Docs/Tutorial.md)

CreateAPI has two main options when it comes to generating source code:

- **`--module`**: Generates Paths and Entities to be incorporated into an existing target/module within your existing codebase.
- **`--package`**: Wraps the generated Paths and Entities in a complete Swift Package definition with any dependencies defined automatically.

To generate code, use the `create-api generate` command:

<details>
<summary><b><code>$ create-api generate --help</code></b></summary>

```
USAGE: create-api generate [<options>] <input>

ARGUMENTS:
  <input>                 The OpenAPI spec input file in either JSON or YAML format

OPTIONS:
  --output <output>       The output folder (default: ./.create-api/)
  --config <config>       The path to generator configuration. If not present, the command
                          will look for .create-api.yaml in the current directory.
                          (default: ./.create-api.yaml)
  -s, --split             Split output into separate files
  -v, --verbose           Print additional logging information
  --strict                Turns all warnings into errors
  -c, --clean             Removes the output folder before continuing
  --allow-errors          Ignore any errors that happen during code generation
  --watch                 Monitor changes to both the spec and the configuration file and
                          automatically re-generated input
  --package <package>     Generates a complete package with a given name
  --module <module>       Use the following name as a module name
  --vendor <vendor>       Enabled vendor-specific logic (supported values: "github")
  --generate <generate>   Specifies what to generate (default: paths, entities)
  --filename-template <filename-template>
                          Example: "%0.generated.swift" will produce files with the
                          following names: "Paths.generated.swift". (default: %0.swift)
  --entityname-template <entityname-template>
                          Example: "%0Generated" will produce entities with the following
                          names: "EntityGenerated". (default: %0)
  --single-threaded       By default, saturates all available threads. Pass this option to
                          turn all parallelization off.
  --measure               Measure performance of individual operations
  -h, --help              Show help information.
```

</details>

In addition to the options passed to the command, you can also define a configuration file to customize the output in various different ways. For a complete list of options, check out the [Configuration Options](./Docs/ConfigOptions.md) documentation.

For more information about using CreateAPI, check out the [Documentation](./Docs/).

## Projects using CreateAPI

Need some inspiration? Check out the list of projects below that are already using CreateAPI:

- [appstoreconnect-swift-sdk](https://github.com/AvdLee/appstoreconnect-swift-sdk)

Are you using CreateAPI in your own open-source project? Let us know by [adding it](https://github.com/CreateAPI/CreateAPI/edit/main/README.md) to the list above!

## Contributing

We always welcome contributions from the community via Issues and Pull Requests. Please be sure to read over the [contributing guidelines](./CONTRIBUTING.md) for more information.

## Releasing

When releasing a new version of CreateAPI, be sure to follow the steps outlined below:

- [ ] Ensure that the `main` branch checks are passing.
- [ ] Update the [version number](https://github.com/CreateAPI/CreateAPI/blob/main/Sources/CreateAPI/CreateAPI.swift#L8).
- [ ] Update the `create-api generate --help` output in **README.md** if it has changed.
- [ ] Update [CHANGELOG.md](./CHANGELOG.md).
  - Use the GitHub generated release notes as a base. Be sure to cleanup the PR links.
- [ ] Create a GitHub Release.
  - Create a new tag using semantic versioning.
  - Use the generated release notes.
- [ ] From the [Release Workflow](https://github.com/CreateAPI/CreateAPI/actions/workflows/release.yml), get the artifactbundle SHA and add an Artifact Bundle section to the release page. For example:
    > ## Artifact Bundle
    >
    > Checksum: `89c75ec3b2938d08b961b94e70e6dd6fa0ff52a90037304d41718cd5fb58bd24`
    >
    > ```swift
    > .binaryTarget(
    >     name: "create-api",
    >     url: "https://github.com/CreateAPI/CreateAPI/releases/download/0.0.5/create-api.artifactbundle.zip",
    >     checksum: "89c75ec3b2938d08b961b94e70e6dd6fa0ff52a90037304d41718cd5fb58bd24"
    > )
    > ```
- [ ] Push the release to Homebrew with `brew bump-formula-pr create-api`.
