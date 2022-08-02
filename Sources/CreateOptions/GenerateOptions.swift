import Foundation
import Yams

@dynamicMemberLookup
public final class GenerateOptions {
    /// The options loaded from a **.create-api.yaml** configuration file (or the default options)
    public let configOptions: ConfigOptions

    /// Acronyms used for replacement when `isReplacingCommonAcronyms` is `true`.
    ///
    /// A set of all acronyms based on the default list after factoring in the `addedAcronyms` and removing `ignoredAcronyms`.
    /// Results are ordered so that the longer acronyms come first.
    public let allAcronyms: [String]

    /// Warnings detected when loading a configuration file
    public let warnings: [String]

    /// The default set of options
    public static let `default` = GenerateOptions()

    init(configOptions: ConfigOptions = .default, warnings: [String] = []) {
        // Support deprecated 'overriden' properties by merging any values into their 'overridden' replacement
        var configOptions = configOptions
        configOptions.paths.overriddenResponses.merge(configOptions.paths.overridenResponses) { new, _ in new }
        configOptions.paths.overriddenBodyTypes.merge(configOptions.paths.overridenBodyTypes) { new, _ in new }

        self.configOptions = configOptions
        self.allAcronyms = Self.allAcronyms(including: configOptions.addedAcronyms, excluding: configOptions.ignoredAcronyms)
        self.warnings = warnings
    }

    public subscript<T>(dynamicMember keyPath: KeyPath<ConfigOptions, T>) -> T {
        configOptions[keyPath: keyPath]
    }
}

// MARK: - Loading
public extension GenerateOptions {
    convenience init(fileURL: URL, process: (inout ConfigOptions) -> Void = { _ in }) throws {
        let data = try Data(contentsOf: fileURL)
        try self.init(data: data, process: process)
    }

    convenience init(data: Data, process: (inout ConfigOptions) -> Void = { _ in }) throws {
        // Decode the options and record any warnings/issues
        let recorder = IssueRecorder()
        let decoder = YAMLDecoder()
        var configOptions = try decoder.decode(ConfigOptions.self, from: data, userInfo: [
            .issueRecorder: recorder
        ])

        // Provide an opportunity to make any required mutations
        process(&configOptions)

        // Call to the default initialiser
        self.init(configOptions: configOptions, warnings: recorder.issues.map(\.description))
    }
}

// MARK: - Acronyms
private extension GenerateOptions {
    static let defaultAcronyms: Set<String> = ["url", "id", "html", "ssl", "tls", "https", "http", "dns", "ftp", "api", "uuid", "json"]

    static func allAcronyms(including: [String], excluding: [String]) -> [String] {
        Self.defaultAcronyms
            .union(including)
            .subtracting(excluding)
            .sorted { $0.count > $1.count }
    }
}
