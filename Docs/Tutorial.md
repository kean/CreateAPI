# Generating an API with CreateAPI

In this tutorial, you are going to create a new library using CreateAPI that talks to the [Swagger Petstore](https://petstore3.swagger.io/) API.

- [Getting Started](#getting-started)
- [Generating a Package](#generating-a-package)
- [Using the Code](#using-the-code)
- [Adding a Configuration File](#adding-a-configuration-file)
- [Updating the Code](#updating-the-code)
- [Next Steps](#next-steps)

## Getting Started

If you haven't already heard about CreateAPI, it's a tool that allows you to generate Swift code from an OpenAPI specification.

For a new project, the easiest way to get started with CreateAPI is to generate the entire package using the `--package` option. Once you have your package in place, you can build upon it yourself and if you need to update the generated entities or paths later on, you can do so using the `--module` option to avoid overwriting the rest of your changes.

If you haven't already, be sure to [install](../README.md#installation) the `create-api` CLI.

## Generating a Package

First things first, you need to generate the package. To do so, there is one key ingredient: The schema. Download the Petstore schema from [https://petstore3.swagger.io/api/v3/openapi.json](https://petstore3.swagger.io/api/v3/openapi.json) and save it somewhere accessible on your computer.

Using terminal, run the `create-api generate` command and specify the following:

1. The `--package` option, followed by the name of your package
2. The `--output` option, followed by the directory that you want to write the package to
3. The path to the schema that you just downloaded

For example:

```bash
$ create-api generate --package "PetstoreKit" --output "./" "path/to/the/downloaded/schema.json"
```

You will see something like the following printed to the console:

> Generating code for schema.json...

And you will find a new folder called **PetstoreKit** located within the output directory. Double click on the **Package.swift** file within the package to open it in Xcode and you will see something like the following:

<img
  src="./Images/Tutorial_01_NewPackage.png#gh-light-mode-only"
  alt="A screenshot of Xcode focusing on the Paths.swift source file within the newly generated PetstoreKit package. To the left, you can see the project navigator which displays the source files (Entites.swift, Paths.swift) and the resolved dependencies (Get, HTTPHeaders, URLQueryEncoder)."
/><img
  src="./Images/Tutorial_01_NewPackage_Dark.png#gh-dark-mode-only"
  alt="A screenshot of Xcode focusing on the Paths.swift source file within the newly generated PetstoreKit package. To the left, you can see the project navigator which displays the source files (Entites.swift, Paths.swift) and the resolved dependencies (Get, HTTPHeaders, URLQueryEncoder)."
/>

Once the dependencies have resolved, build the project and everything will succeed. Congratulations, you've generated your first project using CreateAPI!

## Using the Code

Now that you have the generated Paths and Entities, you probably want to actually put them to good use!

> **Note**: In some cases, you might prefer to use the generated Package as-is by referencing it as a dependency in another project or package (this allows you to regenerate it whenever the spec changes), but for the educational purposes in this tutorial you will work directly inside the package instead.

In the **Sources** directory, add a new file called **PetstoreClient.swift**. Within that file, add the following code:

```swift
import Foundation
import Get

public class PetstoreClient {
    let api: APIClient

    public init() {
        self.api = APIClient(
            baseURL: URL(string: "https://petstore3.swagger.io/api/v3")
        )
    }

    public func findPets(by status: Paths.Pet.FindByStatus.Status) async throws -> [Pet] {
        let request = Paths.pet.findByStatus.get(status: status)
        let response = try await api.send(request)
        return response.value
    }
}
```

Lets summarize the key parts of this code:

1. You import [Get](https://github.com/kean/get) to access the `APIClient`.
2. You initialize the `PetstoreClient`'s `api` with the appropriate `baseURL`.
3. You define the `findPets(by:)` method that accepts a generated enum for the `status` argument and returns an array of generated `Pet` types.
4. You create the request that uses the generated `Paths` definition.

And that's it! You can now use your new PetstoreKit module in tests, an executable target or even your own app like the following:

```swift
import PetstoreKit

// ...

let client = PetstoreClient()
let pets = try await client.findPets(by: .available)

let options = pets.map(\.name).formatted(.list(type: .or))
print("Which pet would you like to buy?", options)
```

## Adding a Configuration File

Now that you have learned the basics, you will probably find that you want to customize the generated code in one way or another. If so, you'll be happy to know that there are plenty of options available!

The vast majority of configuration options are managed through a yaml (or json) file that you specify using the `--config` option when running the generator.

Lets say that you want PetstoreKit to generate entities as classes instead of structs, and that you want to format your Paths using their `operationId` instead. Create a new file called **create-api.yml** and paste the following contents:

```yaml
isSwiftLintDisabled: false
entities:
  isGeneratingStructs: false
paths:
  style: operations
  namespace: APIOperation
```

> **Note**: To understand what these options mean and to discover other options, be sure to read the [Configuration Options](./ConfigOptions.md) documentation.

Now that you've created a configuration file, the next step is to regenerate your source files. To do that, keep on reading.

## Updating the Code

In the beginning, you generated an entire Swift Package using the `--package` option. If you were to run this again, it would likely overwrite any manual changes that you made.

Instead, you can use the `--module` option which will tell CreateAPI only to regenerate the Entities and Paths within the PetstoreKit module. One thing to consider is that you will need to adjust the output directory so that you are generating directly into the nested **Sources** directory.

```bash
$ create-api generate --module "PetstoreKit" --config "/path/to/create-api.yml" --output "./PetstoreKit/Sources/" "/path/to/schema.json"
```

To summarize the options:

- `--module` - Indicates that you are generating code within a specific module, uses the module name to avoid namespace collisions.
- `--config` - The path to your configuration file to apply customizations to generated code.
- `--output` - The directory to write the generated code to.

If you used the exact configuration in this example, you'll now notice that your `PetstoreClient` implementation no longer compiles. Have a go at updating it to reflect the changes in generated code.

## Next Steps

Congratulations for making it though this tutorial. Using CreateAPI to generate your API code can be a very powerful productivity booster. Because there are so many different types of APIs and different ways of working, it can take a bit of time to find flows that work best for you, but be sure to checkout the additional resources below to learn more about how to make the most of CreateAPI.

- [Configuration Options](./ConfigOptions.md)
- [Swift Package Plugins](./SwiftPackagePlugins.md)
- [Advanced Setup](./AdvancedSetup.md)
- [Get](http://github.com/kean/get)
