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

For a new project, the easiest way to get started with CreateAPI is to generate a Swift Package. Once you have your package in place, you can add it as a dependency to your projects and use the generated interfaces just like you would with hand written code.

If you haven't already, be sure to [install](../README.md#installation) the `create-api` CLI.

## Generating a Package

First things first, you need to generate the package. To do so, there is one key ingredient: The schema. Download the Petstore schema from [https://petstore3.swagger.io/api/v3/openapi.json](https://petstore3.swagger.io/api/v3/openapi.json) and save it somewhere accessible on your computer.

Using terminal, run the `create-api generate` command like the following example:

```bash
$ create-api generate "schema.json" --output "./PetstoreKit" --config-option "module=PetstoreKit"
```

You might want to substitute the above values with the real ones so lets just go over what they are doing:

1. `"schema.json"` - The path to the schema file that you downloaded earlier.
2. `--output "./PetstoreKit"` - Indicates that we want to write the generated package into the PetstoreKit directory.
3. `--config-option "module=PetstoreKit"` - Defines the name of the module (and package product) as PetstoreKit.

You will see something like the following printed to the console:

> Generating code for schema.json...

And you will find a new folder called **PetstoreKit** located within the output directory. Double click on the **Package.swift** file within the package to open it in Xcode and you will see something like the following:

<img
  src="./Images/Tutorial_01_NewPackage.png#gh-light-mode-only"
  alt="A screenshot of Xcode focusing on a swift source file within the newly generated PetstoreKit package. To the left, you can see the project navigator which displays all of the source files and the resolved dependencies (Get, HTTPHeaders, URLQueryEncoder)."
/><img
  src="./Images/Tutorial_01_NewPackage_Dark.png#gh-dark-mode-only"
  alt="A screenshot of Xcode focusing on a swift source file within the newly generated PetstoreKit package. To the left, you can see the project navigator which displays all of the source files and the resolved dependencies (Get, HTTPHeaders, URLQueryEncoder)."
/>

Once the dependencies have resolved, build the project and everything will succeed. Congratulations, you've generated your first project using CreateAPI!

## Using the Code

Now that you have the generated Paths and Entities, you probably want to actually put them to good use!

To do this, you aren't going to make any changes to your newly generated Package because you might want to regenerate it later. Instead, you are going to integrate the package into a different project.

Close PetstoreKit if its open in Xcode and in the Menu click **File** ▸ **New** ▸ **Project...** and create a project called Petstore.

To integrate PetstoreKit within your Petstore project, drag the PetstoreKit folder from finder and drop it beneath the Petstore project in the project navigator:

<img
  src="./Images/Tutorial_02_PetstoreProject.png#gh-light-mode-only"
  alt="A screenshot of Xcode focusing on the PetstoreKit package within the Petstore project after dropping it inside the project files in the project navigator."
/><img
  src="./Images/Tutorial_02_PetstoreProject_Dark.png#gh-dark-mode-only"
  alt="A screenshot of Xcode focusing on the PetstoreKit package within the Petstore project after dropping it inside the project files in the project navigator."
/>

The last thing you need to do before you can use your generated package is to add it under the **Frameworks, Libraries, and Embedded Content** section for the Petstore target:

<img
  src="./Images/Tutorial_03_AddDependency.png#gh-light-mode-only"
  alt="A screenshot of Xcode focusing on the General tab within the target settings. In the 'Frameworks, Libraries, and Embedded Content' section, the PetstoreKit library has been added."
/><img
  src="./Images/Tutorial_03_AddDependency_Dark.png#gh-dark-mode-only"
  alt="A screenshot of Xcode focusing on the General tab within the target settings. In the 'Frameworks, Libraries, and Embedded Content' section, the PetstoreKit library has been added."
/>

All set! Now, in the **Petstore** group, add a new file called **PetstoreClient.swift**. Within that file, add the following code:

```swift
import Foundation
import Get
import PetstoreKit

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

1. You import [**Get**](https://github.com/kean/get) to access the `APIClient`.
2. You import **PetstoreKit** to access your generated paths and entities.
2. You initialize the `PetstoreClient`'s `api` with the appropriate `baseURL`.
3. You define the `findPets(by:)` method that accepts a generated enum for the `status` argument and returns an array of generated `Pet` types.
4. You create the request that uses the generated `Paths` definition.

And that's it! You can now go ahead and use this code to build your Petstore! For example:

```swift
import PetstoreKit
import SwiftUI

struct ContentView: View {
    let client = PetstoreClient()
    @State private var pets: [Pet]? = nil

    var body: some View {
        if let pets = pets {
            List {
                Section("Sold") {
                    ForEach(pets, id: \.id) { pet in
                        Text(pet.name)
                    }
                }
            }
        } else {
            Text("Loading...")
                .task {
                    self.pets = try? await client.findPets(by: .sold)
                }
        }
    }
}
```

## Adding a Configuration File

Now that you have learned the basics, you will probably find that you want to customize the generated code in one way or another. If so, you'll be happy to know that there are plenty of options available!

The vast majority of configuration options are managed through a yaml (or json) file that you specify using the `--config` option when running the generator.

Lets say that you want your entities to automatically conform to the `Identifiable` protocol, or you want to use a different style for the generated Paths. Go ahead and paste the following into a new filed called **create-api.yaml**:

```yaml
module: PetstoreKit
entities:
  includeIdentifiableConformance: true
paths:
  style: operations
  namespace: APIOperation
```

> **Note**: To understand what these options mean and to discover other options, be sure to read the [Configuration Options](./ConfigOptions.md) documentation.

Now that you've created a configuration file, the next step is to regenerate your source files. To do that, keep on reading.

## Updating the Code

You'll need to regenerate your code whenever your schema is updated or you make modifications to your configuration file. To do so, run a command like the following:

```bash
$ create-api generate "schema.json" --config "create-api.yaml" --output "./PetstoreKit" --clean
```

This is similar to the original command that you ran, but there are some key differences:

1. You no longer need the `--config-option` override because we've defined the `module` name in the configuration file itself.
2. You tell the generator where to find the configuration file by using `--config "create-api.yaml"`.
3. You add the `--clean` option to ensure that the contents of the **./PetstoreKit** directory are reset each time you run the generator. This helps to clean up unused files that might no longer be relevant.

In the output, you'll get a similar message to last time and if you go back to the Petstore project and try to build, you'll likely find that the project no longer compiles. Don't worry though, this is expected because your configuration now generates a slightly different output!

Take a look though the generated source files in PetstoreKit to see what has changed and have a go at updating your implementation of `PetstoreClient`.

## Next Steps

Congratulations for making it though this tutorial. Using CreateAPI to generate your API code can be a very powerful productivity booster. Because there are so many different types of APIs and different ways of working, it can take a bit of time to find flows that work best for you, but be sure to checkout the additional resources below to learn more about how to make the most of CreateAPI.

- [Configuration Options](./ConfigOptions.md)
- [Swift Package Plugins](./SwiftPackagePlugins.md)
- [Advanced Setup](./AdvancedSetup.md)
- [Get](http://github.com/kean/get)

If you have any questions or feedback, you are always welcome to [Submit an Issue](https://github.com/CreateAPI/CreateAPI/issues/new).
