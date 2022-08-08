import Foundation

/// A utility tool for writing multiple source files into a directory (and subdirectories)
class OutputWriter {
    typealias Writer = (_ contents: String, _ components: [String]) throws -> Void
    let pathComponents: [String]
    let performWrite: Writer

    convenience init(outputURL: URL, fileManger: FileManager = .default) throws {
        // Ensure the outputURL is not a file
        var isDirectory = ObjCBool(false)
        if fileManger.fileExists(atPath: outputURL.path, isDirectory: &isDirectory) && !isDirectory.boolValue {
            throw GeneratorError("output cannot be a file")
        }

        // Record the output paths to warn when mistakenly overwriting
        var writtenPaths: Set<String> = []

        // Create the initial writer
        self.init(pathComponents: []) { contents, pathComponents in
            let subpath = pathComponents.joined(separator: "/")
            if writtenPaths.contains(subpath) {
                throw GeneratorError("Attempting to overwrite contents of \(subpath)")
            }

            // Create the subdirectory if it doesn't already exist
            let fileURL = outputURL.appending(path: subpath)
            let directoryURL = fileURL.deletingLastPathComponent()
            try directoryURL.createDirectoryIfNeeded()

            // Write the source to file
            try contents.write(to: fileURL)
            writtenPaths.insert(subpath)
        }
    }

    private init(pathComponents: [String], performWrite: @escaping Writer) {
        self.pathComponents = pathComponents
        self.performWrite = performWrite
    }

    /// Writes the contents of a string to a file with the given name in the current directory
    func write(_ contents: String, to filename: String) throws {
        let components = pathComponents + [filename]
        try performWrite(contents, components)
    }

    /// Returns a new writer for writing in the given subdirectory
    func writer(in subdirectory: String...) -> OutputWriter {
        OutputWriter(pathComponents: pathComponents + subdirectory, performWrite: performWrite)
    }
}
