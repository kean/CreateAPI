import ArgumentParser
import Foundation

/// A wrapper for reading the location of the configuration file and a utility for providing the resolved `fileURL`.
struct ConfigFileLocation {
    var userDefinedPath: String?
    let defaultPath = ".create-api.yaml"

    /// Returns the resolved fileURL, which can be one of the following:
    ///
    /// 1. A path to the user defined configuration file.
    /// 2. A path to the configuration at the default location **if** the file exists.
    /// 3. `nil` if a file did not exist at the default location.
    ///
    /// - throws: `GeneratorError` if the file does not exist at the user defined location.
    var fileURL: URL? {
        get throws {
            let isUserDefined = userDefinedPath != nil
            let fileURL = URL(filePath: userDefinedPath ?? defaultPath)

            let fileManager = FileManager.default
            if fileManager.fileExists(atPath: fileURL.path) {
                return fileURL
            }

            if isUserDefined {
                throw GeneratorError("The configuration file at \(fileURL.path) does not exist.")
            } else {
                return nil // Indicates that no configuration was provided, use the default.
            }
        }
    }

    init() {
        self.userDefinedPath = nil
    }
}

// MARK: - ExpressibleByArgument
extension ConfigFileLocation: ExpressibleByArgument {
    init?(argument: String) {
        self.userDefinedPath = argument
    }

    var defaultValueDescription: String {
        defaultPath
    }

    static var allValueStrings: [String] {
        []
    }

    static var defaultCompletionKind: CompletionKind {
        .file(extensions: ["yaml", "yml", "json"])
    }
}
