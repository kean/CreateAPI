import ArgumentParser
import struct ConfigurationParser.OptionOverride
import CreateOptions
import OpenAPIKit30
import Foundation
import Yams

// TODO: Generate `README.md` for package (see `info`)
// TODO: Disable sandbox
// TODO: Add OpenAPI 3.1 support

struct Generate: ParsableCommand {
    private static let supportedFileFormats: [String] = ["yml", "yaml", "json"]

    @Argument(help: "The OpenAPI spec input file in either JSON or YAML format")
    var input: String

    @Option(help: "The directory where generated outputs are written")
    var output = "CreateAPI"

    @Option(help: ArgumentHelp("The path to generator configuration.", discussion: """
        If not provided, the command will automatically try using .create-api.yaml \
        in the current directory if it exists.
        """))
    var config = ConfigFileLocation()

    @Option(help: ArgumentHelp("Options to be applied when generating.", discussion: """
        In scenarios where you need to customize behaviour when invoking the \
        generator, use this option to specify individual overrides. For example:

        --config-option "entities.filenameTemplate=%0DTO.swift"

        You can specify multiple --config-option arguments and the value of each \
        one must match the 'keyPath=value' format above where keyPath is a dot \
        separated path to the option and value is the yaml/json representation \
        of the option.
        """))
    var configOption: [OptionOverride] = []

    @Flag(help: ArgumentHelp("Merge Entities and Paths into single output files", discussion: """
        Merging the source files offers a compact output, but prevents the compiler \
        from parallelizing build tasks resulting in slower builds for larger schemas.
        """))
    var mergeSources = false

    @Flag(name: .shortAndLong, help: "Print additional logging information")
    var verbose = false

    @Flag(help: "Turns all warnings into errors")
    var strict = false

    @Flag(name: .shortAndLong, help: "Removes the output folder before continuing")
    var clean = false

    @Flag(help: "Ignore any errors that happen during code generation")
    var allowErrors = false

    #if os(macOS)
    @Flag(help: "Monitor changes to both the spec and the configuration file and automatically re-generated input")
    var watch = false
    #endif

    @Option(help: "Generates a complete package with a given name")
    var package: String?

    @Option(help: "Use the following name as a module name")
    var module: String?

    @Option(help: "Enabled vendor-specific logic (supported values: \"github\")")
    var vendor: String?

    @Option(help: "Specifies what to generate", completion: .list(["paths", "entities"]))
    var generate = ["paths", "entities"]

    @Option(help: "Example: \"%0Generated\" will produce entities with the following names: \"EntityGenerated\".")
    var entitynameTemplate: String = "%0"

    @Flag(help: "By default, saturates all available threads. Pass this option to turn all parallelization off.")
    var singleThreaded = false

    @Flag(help: "Measure performance of individual operations")
    var measure = false

    func run() throws {
        Benchmark.isEnabled = measure
        #if os(macOS)
        if watch {
            let paths = [try config.fileURL?.path, input].compactMap { $0 }
            _ = try Watcher(paths: paths, run: _run)
            RunLoop.main.run()
            return
        }
        #endif

        try _run()
    }

    private func _run() throws {
        print("Generating code for \(input.filename)...")
        let benchmark = Benchmark(name: "Generation")
        try actuallyRun()
        benchmark.stop()
    }

    private func actuallyRun() throws {
        let spec = try parseInputSpec()
        let options = try readOptions()
        try validateOptions(options: options)

        let generator = Generator(spec: spec, options: options, arguments: arguments)
        // IMPORTANT: Paths needs to be generated before schemes.
        let paths = generate.contains("paths") ? try generator.paths() : nil
        let schemas = generate.contains("entities") ? try generator.schemas() : nil
        let package = generator.package(named: package)

        let outputURL = URL(filePath: output)
        let output = Output(paths: paths, entities: schemas, package: package, options: options, mergeSources: mergeSources)

        if clean { try? FileManager.default.removeItem(at: outputURL) }

        let benchmark = Benchmark(name: "Write output files")
        try output.write(to: outputURL)
        benchmark.stop()
    }

    private func validateOptions(options: GenerateOptions) throws {
        let outputPath = URL(fileURLWithPath: output).resolvingSymlinksInPath().path
        if clean, let configPath = try config.fileURL?.resolvingSymlinksInPath().path, configPath.hasPrefix(outputPath) {
            throw GeneratorError("Unable to clean because your config file is in the output directory")
        }
        if clean, URL(fileURLWithPath: input).resolvingSymlinksInPath().path.hasPrefix(outputPath) {
            throw GeneratorError("Unable to clean because your input spec is in the output directory")
        }
        if module != nil && package != nil {
            throw GeneratorError("`module` and `package` parameters are mutually exclusive")
        }
        if package == nil && module == nil {
            throw GeneratorError("You must provide either `module` or `package`")
        }
        if !options.entities.exclude.isEmpty && !options.entities.include.isEmpty {
            throw GeneratorError("`exclude` and `include` can't be used together")
        }
        if !options.paths.exclude.isEmpty && !options.paths.include.isEmpty {
            throw GeneratorError("`exclude` and `include` can't be used together")
        }
    }

    private func readOptions() throws -> GenerateOptions {
        let url = try config.fileURL

        do {
            let options = try GenerateOptions(fileURL: url, overrides: configOption) { options in
                options.entities.include = Set(options.entities.include.map { Template(arguments.entityNameTemplate).substitute($0) })
                options.entities.exclude = Set(options.entities.exclude.map {
                    DottedDeclaration(first: Template(arguments.entityNameTemplate).substitute($0.first), second: $0.second)
                })
            }

            for message in options.warnings {
                let prefix = strict ? "ERROR" : "WARNING"
                print("\(prefix): \(message)")
            }

            if strict && !options.warnings.isEmpty {
                throw GeneratorError("Issues were detected in \(url?.path ?? "nil")")
            }

            return options
        } catch {
            throw GeneratorError("Failed to read configuration. \(error)")
        }
    }

    private func parseInputSpec() throws -> OpenAPI.Document {
        VendorExtensionsConfiguration.isEnabled = false

        let inputURL = URL(filePath: input)

        guard Self.supportedFileFormats.contains(inputURL.pathExtension) else {
            let extensions = Self.supportedFileFormats.map({ "`\($0)`" }).joined(separator: ", ")
            throw GeneratorError("The file must have one of the following extensions: \(extensions).")
        }

        var bench = Benchmark(name: "Read spec data")
        let data = try Data(contentsOf: inputURL)
        bench.stop()

        bench = Benchmark(name: "Parse spec")
        let spec: OpenAPI.Document
        do {
            if !singleThreaded {
                spec = try YAMLDecoder().decode(ParallelDocumentParser.self, from: data).document
            } else {
                spec = try YAMLDecoder().decode(OpenAPI.Document.self, from: data)
            }
        } catch {
            throw GeneratorError("ERROR! The spec is missing or invalid. \(OpenAPI.Error(from: error))")
        }
        bench.stop()
        return spec
    }

    private var arguments: GenerateArguments {
        guard let module = (package ?? module).map(ModuleName.init(processing:)) else {
            fatalError("You must provide either `module` or `package`")
        }
        return GenerateArguments(isVerbose: verbose, isParallel: !singleThreaded, isStrict: strict, isIgnoringErrors: allowErrors, vendor: vendor, module: module, entityNameTemplate: entitynameTemplate)
    }
}
