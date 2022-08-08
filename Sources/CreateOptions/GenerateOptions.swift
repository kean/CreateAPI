import ConfigurationParser
import Foundation
import Yams

@dynamicMemberLookup
public final class GenerateOptions {
    /// The options loaded from a **.create-api.yaml** configuration file (or the default options)
    public let configOptions: ConfigOptions

    /// Warnings detected when loading a configuration file
    public let warnings: [String]

    /// The default set of options
    public static let `default` = GenerateOptions()

    init(configOptions: ConfigOptions = .default, warnings: [String] = []) {
        var configOptions = configOptions
        configOptions.acronyms.sort { $0.count > $1.count } // important that longest is found first when searching

        self.configOptions = configOptions
        self.warnings = warnings
    }

    public subscript<T>(dynamicMember keyPath: KeyPath<ConfigOptions, T>) -> T {
        configOptions[keyPath: keyPath]
    }
}

// MARK: - Loading
public extension GenerateOptions {
    convenience init(
        fileURL: URL?,
        process: (inout ConfigOptions) -> Void = { _ in }
    ) throws {
        let data = try fileURL.flatMap { try Data(contentsOf: $0) }
        try self.init(data: data, process: process)
    }

    convenience init(
        data: Data?,
        process: (inout ConfigOptions) -> Void = { _ in }
    ) throws {
        // Configure the decoder and issue reporting
        let decoder = YAMLDecoder()
        var issues: [Issue] = []
        let issueHandler: IssueHandler = { issue in issues.append(issue) }

        // Parse the options being sure to record any issues
        var configOptions: ConfigOptions
        if let data = data {
            configOptions = try .parse(data, decoder: decoder, issueHandler: issueHandler)
        } else {
            configOptions = .default
        }

        // Provide an opportunity to make any required mutations
        process(&configOptions)

        // Call to the default initialiser
        self.init(configOptions: configOptions, warnings: Issue.warnings(for: issues))
    }
}
