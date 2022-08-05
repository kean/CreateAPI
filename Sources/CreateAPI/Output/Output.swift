import CreateOptions
import Foundation

struct Output {
    let paths: GeneratorOutput?
    let entities: GeneratorOutput?
    let package: (name: String, manifest: GeneratedFile)?
    let options: GenerateOptions
    let mergeSources: Bool // Will soon be internal to GenerateOptions

    /// Writes the output into the given directory.
    func write(to outputURL: URL) throws {
        // Create the output writer and begin
        let rootWriter = try OutputWriter(outputURL: outputURL)

        // Write the Package.swift manifest file, or figure out the writer for source files
        let sourceWriter: OutputWriter
        if let package = package {
            let packageWriter = rootWriter.writer(in: package.name)
            // TODO: Use `write(file:header:template:options:)` to match indentation for Package.swift?
            try packageWriter.write(package.manifest.contents, to: "\(package.manifest.name).swift")

            sourceWriter = packageWriter.writer(in: "Sources")
        } else {
            sourceWriter = rootWriter
        }

        // Write paths into the source directory
        if let paths = paths {
            try write(paths, to: sourceWriter, group: "Paths", template: options.paths.filenameTemplate)
        }

        // Write entities into the source directory
        if let entities = entities {
            try write(entities, to: sourceWriter, group: "Entities", template: options.entities.filenameTemplate)
        }
    }

    private func write(_ output: GeneratorOutput, to writer: OutputWriter, group: String, template: String) throws {
        let template = Template(template)
        if mergeSources {
            let merged = GeneratedFile(name: group, merging: output.files)
            try writer.write(file: merged, header: output.header, template: template, options: options)
        } else {
            let writer = writer.writer(in: group)
            for file in output.files {
                try writer.write(file: file, header: output.header, template: template, options: options)
            }
        }

        for file in output.extensions {
            try writer.write(file: file, header: output.header, options: options)
        }
    }
}

private extension OutputWriter {
    func write(
        file: GeneratedFile,
        header: String? = nil,
        template: Template = Template("%0.swift"),
        options: GenerateOptions
    ) throws {
        let contents = [header, file.contents].compactMap({ $0 }).joined(separator: "\n\n")
        let formatted = contents.indent(using: options).appending("\n")

        let filename = template.substitute(file.name)

        try write(formatted, to: filename)
    }
}

private extension GeneratedFile {
    /// Merges the contents of multiple files into a single file with the given name
    init(name: String, merging files: [GeneratedFile]) {
        self.init(name: name, contents: files.map(\.contents).joined(separator: "\n\n"))
    }
}
