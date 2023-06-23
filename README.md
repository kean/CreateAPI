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

CreateAPI can generate complete Swift Package bundles but can also generate individual components to integrate into an existing project. Either way, you'll want to use the `generate` command:

<details>
<summary><b><code>$ create-api generate --help</code></b></summary>

```
USAGE: create-api generate <input> [--output <output>] [--config <config>] [--config-option <config-option> ...] [--verbose] [--strict] [--allow-errors] [--clean] [--watch] [--single-threaded] [--measure]

ARGUMENTS:
  <input>                 The path to the OpenAPI spec in either JSON or YAML format

OPTIONS:
  --output <output>       The directory where generated outputs are written (default: CreateAPI)
  --config <config>       The path to the generator configuration. (default: .create-api.yaml)
  --config-option <config-option>
                          Option overrides to be applied when generating.

        In scenarios where you need to customize behaviour when invoking the generator, use this option to
        specify individual overrides. For example:

        --config-option "module=MyAPIKit"
        --config-option "entities.filenameTemplate=%0DTO.swift"

        You can specify multiple --config-option arguments and the value of each one must match the
        'keyPath=value' format above where keyPath is a dot separated path to the option and value is the
        yaml/json representation of the option.

  -v, --verbose           Enables verbose log messages
  --strict                Treats warnings as errors and fails generation
  --allow-errors          Ignore errors that occur during generation and continue if possible
  -c, --clean             Removes the output directory before writing generated outputs
  --watch                 Monitor changes to both the spec and the configuration file and automatically
                          regenerate outputs
  --single-threaded       Disables parallelization
  --measure               Measure performance of individual operations and log timings
  --version               Show the version.
  -h, --help              Show help information.
```

</details>

To try CreateAPI out, run the following commands:

```bash
$ curl "https://petstore3.swagger.io/api/v3/openapi.json" > schema.json
$ create-api generate schema.json --config-option module=PetstoreKit --output PetstoreKit
$ cd PetstoreKit
$ swift build
```

There you have it, a comping Swift Package ready to be integrated with your other Swift projects!

For more information about using CreateAPI, check out the [Documentation](./Docs/).

## Projects using CreateAPI

Need some inspiration? Check out the list of projects below that are already using CreateAPI:

- [appstoreconnect-swift-sdk](https://github.com/AvdLee/appstoreconnect-swift-sdk)
- [jellyfin-sdk-swift](https://github.com/jellyfin/jellyfin-sdk-swift)
- [MareaAPI](https://github.com/bouwman/MareaAPI)

Are you using CreateAPI in your own open-source project? Let us know by [adding it](https://github.com/CreateAPI/CreateAPI/edit/main/README.md) to the list above!

## Contributing

We always welcome contributions from the community via Issues and Pull Requests. Please be sure to read over the [contributing guidelines](./CONTRIBUTING.md) for more information.
