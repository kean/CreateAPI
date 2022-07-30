import Foundation

// The `ConfigOptions` type defined in this source file serves multiple purposes:
//
// 1. A Decodable type that can deserialize the create-api.yaml options
// 2. A reference for the default values of each option
// 3. The documentation for all options
//
// We use Sourcery to generate the CreateOptions.md document from this type as
// well as a custom Decodable initializer implementation that falls back to the
// default values.
//
// If you modify the ConfigOptions type below, be sure to run `make documentation`
// again from terminal and commit the changes. You will need sourcery installed.
//
// https://github.com/krzysztofzablocki/Sourcery
//
// To understand more about how sourcery works, check out the .sourcery.yml file
// as well as the templates in the Sourcery directory.

// sourcery: document, root, decodableWithDefault
/// CreateAPI supports a massive number of customization options to generate the most appropriate source code for your api.
///
/// To use these options, you must define a configuration file that includes these properties. This can be done using either YAML or JSON, for example:
///
/// **create-api.yaml**:
///
/// ```yaml
/// access: internal
/// fileHeaderComment: |
///   // Generated by Create API
///   // https://github.com/CreateAPI/CreateAPI
/// entities:
///   isGeneratingStructs: false
///   isGeneratingInitializers: false
/// paths:
///   style: operations
/// ```
///
/// **create-api.json**:
///
/// ```json
/// {
///   "access": "internal",
///   "fileHeaderComment": "// Generated by Create API\n// https://github.com/CreateAPI/CreateAPI\n",
///   "entities": {
///     "isGeneratingStructs": false,
///     "isGeneratingInitializers": false
///   },
///   "paths": {
///     "style": "operations"
///   }
/// }
/// ```
///
/// After creating your configuration, you can use the `--config` option when running `create-api` to use it.
///
/// Below you can find the complete documentation for all available options.
public struct ConfigOptions: Encodable {
    /// The default generator options
    public static let `default` = ConfigOptions()

    /// Access level modifier for all generated declarations
    public var access: String = "public"

    /// Add `@available(*, deprecated)` attribute to deprecated types and properties
    public var isAddingDeprecations: Bool = true

    /// Generate enums for strings
    public var isGeneratingEnums: Bool = true

    /// Prefixes booleans with `is` ("enabled" -> "isEnabled")
    public var isGeneratingSwiftyBooleanPropertyNames: Bool = true

    /// Any schema that can be converted to a type identifier.
    /// For example, `typealias Pets = [Pet]` is inlined as `[Pet]`.
    public var isInliningTypealiases: Bool = true

    /// For example, `var sourcelUrl` becomes `var sourceURL`.
    public var isReplacingCommonAcronyms: Bool = true

    /// Acronyms to add to the default list
    public var addedAcronyms: [String] = []

    /// Acronyms to remove from the default list
    public var ignoredAcronyms: [String] = []

    /// Available levels of indentation
    public enum Indentation: String, Codable {
        case spaces
        case tabs
    }

    /// Change the style of indentation. Supported values:
    /// - `spaces`
    /// - `tabs`
    public var indentation: ConfigOptions.Indentation = .spaces

    /// Number of spaces to use when `indentation` is set to `spaces`.
    public var spaceWidth: Int = 4

    /// For example, `public var file: [File]` becomes `public var files: [File]`
    public var isPluralizationEnabled: Bool = true

    /// Parses dates (e.g. `"2021-09-29"`) using [NaiveDate](https://github.com/CreateAPI/NaiveDate)
    public var isNaiveDateEnabled: Bool = true

    /// If enabled, uses `Int64` or `Int32` when specified.
    public var isUsingIntegersWithPredefinedCapacity: Bool = false

    /// Appends the `swiftlint:disable all` annotation beneath the header in generated files
    public var isSwiftLintDisabled: Bool = true

    /// Overrides file header comment
    public var fileHeaderComment: String = "// Generated by Create API\n// https://github.com/CreateAPI/CreateAPI"

    public var comments: Comments = .init()

    // sourcery: document, decodableWithDefault
    /// Customize specific behaviors when generating comments on entities/paths/properties.
    public struct Comments: Encodable {
        /// Set to false to disable the generation of comments, for example:
        ///
        /// ```yaml
        /// comments:
        ///   isEnabled: false
        /// ```
        public var isEnabled: Bool = true

        /// Include the schema title when generating comments
        public var isAddingTitles: Bool = true

        /// Include the schema description when generating comments
        public var isAddingDescription: Bool = true

        /// Include the schema example when generating comments
        public var isAddingExamples: Bool = true

        /// Include a link to external documentation when generating comments
        public var isAddingExternalDocumentation: Bool = true

        /// Auto-capitalize comments
        public var isCapitalizationEnabled: Bool = true
    }

    public var entities: Entities = .init()

    // sourcery: document, decodableWithDefault
    /// Options specifically related to generating entities
    public struct Entities: Encodable {
        /// When true, generates entities as `struct` types. Otherwise generates them as `class` types.
        public var isGeneratingStructs: Bool = true

        /// Explicitly generate the following entities as `class` types
        public var entitiesGeneratedAsClasses: Set<String> = []

        /// Explicitly generate the given entities as `struct` types
        public var entitiesGeneratedAsStructs: Set<String> = []

        /// Modules to be imported within the source files for generated entities
        public var imports: Set<String> = []

        /// When generating `class` types, marks them as `final`
        public var isMakingClassesFinal: Bool = true

        /// When generating `class` types, generate the properties as `public var`
        public var isGeneratingMutableClassProperties: Bool = false

        /// When generating `struct` types, generate the properties as `public var`
        public var isGeneratingMutableStructProperties: Bool = true

        /// Base class used when generating `class` types
        public var baseClass: String? = nil

        /// Protocols to be adopted by each generated entity
        public var protocols: Set<String> = ["Codable"]

        /// Automatically generate `Identifiable` conformance for entities that include an `id` property.
        public var isGeneratingIdentifiableConformance: Bool = false

        /// Automatically removes `Encodable` or `Decodable` conformance when it is not required
        public var isSkippingRedundantProtocols: Bool = true

        // TODO: simplify these three options
        /// Generate an initializer for each entity
        public var isGeneratingInitializers: Bool = true

        // TODO: simplify this
        // sourcery: skip
        /// Generate the `init(from:)` initializer for `Decodable` conformance when required
        public var isGeneratingInitWithDecoder: Bool = true

        // TODO: simplify this
        // sourcery: skip
        /// Generate the `encode(to:)` method for `Encodable` conformance when required
        public var isGeneratingEncodeWithEncoder: Bool = true

        /// Orders properties of an entity alphabetically instead of the order defined in the schema
        public var isSortingPropertiesAlphabetically: Bool = false

        /// If disabled, will use strings as `CodingKey` values.
        ///
        /// For schemas with a large number of entities, disabling this option can help to reduce the binary size.
        public var isGeneratingCustomCodingKeys: Bool = true

        /// If defined, uses the `default` value from the schema for the generated property for booleans
        public var isAddingDefaultValues: Bool = true

        /// For `allOf` inline properties from references
        public var isInliningPropertiesFromReferencedSchemas: Bool = false

        /// Changes how unspecified additional properties are interpreted
        public var isAdditionalPropertiesOnByDefault: Bool = true

        /// Strips the parent name of enum cases within objects that are `oneOf` / `allOf` / `anyOf` of nested references
        public var isStrippingParentNameInNestedObjects: Bool = false

        /// When set to a non-empty value, entities with the given names will be ignored during generation.
        /// Cannot be used in conjunction with `include`.
        public var exclude: Set<String> = []

        /// When set to a non-empty value, only entities matching the given names will be generated.
        /// This cannot be used in conjunction with `exclude`.
        public var include: Set<String> = []
    }

    public var paths: Paths = .init()

    public enum PathsStyle: String, Codable {
        case rest
        case operations
    }

    // sourcery: document, decodableWithDefault
    /// Options specifically related to generating paths
    public struct Paths: Encodable {
        /// The style used when generating path definitions
        ///
        /// - `rest` - Generates nest structs to represent path components
        /// - `operations` - Generates a plain list of request operations
        public var style: ConfigOptions.PathsStyle = .rest

        /// The namespace type for all generated paths
        public var namespace: String = "Paths"

        /// Generate response headers using [HTTPHeaders](https://github.com/CreateAPI/HTTPHeaders)
        public var isGeneratingResponseHeaders: Bool = true

        /// Adds the operation id to each request
        public var isAddingOperationIds: Bool = false

        /// Modules to be imported within the source files for generated requests
        public var imports: Set<String> = ["Get"]

        /// Allows you to override mapping of specific response types to a custom (or generated) type instead.
        ///
        /// For example:
        ///
        /// ```yaml
        /// paths:
        ///   overridenResponses:
        ///     MyApiResponseType: MyCustomDecodableType
        /// ```
        public var overridenResponses: [String: String] = [:]

        /// Tell CreateAPI how to map an unknown request or response content types to a Swift type used in the path generation.
        ///
        /// For example:
        ///
        /// ```yaml
        /// paths:
        ///   overridenBodyTypes:
        ///     application/octocat-stream: String
        /// ```
        public var overridenBodyTypes: [String: String] = [:]

        /// Inline simple requests, like the ones with a single parameter
        public var isInliningSimpleRequests: Bool = true

        /// Inline query parameters for simple requests instead of generating a Parameter type
        public var isInliningSimpleQueryParameters: Bool = true

        /// The threshold of query parameters to inline when using `isInliningSimpleQueryParameters`.
        public var simpleQueryParametersThreshold: Int = 2

        // TODO: Replace this with a better solution for patch params
        // sourcery: skip
        public var isMakingOptionalPatchParametersDoubleOptional: Bool = false

        /// Remove redundant paths if possible
        public var isRemovingRedundantPaths: Bool = true

        /// When set to a non-empty value, the given paths will be ignored during generation.
        /// Cannot be used in conjunction with `include`.
        public var exclude: Set<String> = []

        /// When set to a non-empty value, only the given paths will be generated.
        /// This cannot be used in conjunction with `exclude`.
        public var include: Set<String> = []
    }

    public var rename: Rename = .init()

    // sourcery: document, decodableWithDefault
    /// Options used to configure detailed renaming rules for all aspects of the generated code.
    public struct Rename: Encodable {
        /// Rename rules for properties specific to a given type, or all properties with a matching name.
        ///
        /// ```yaml
        /// rename:
        ///   properties:
        ///     name: firstName # renames any property called 'name' to 'firstName'
        ///     SimpleUser.name: firstName # renames only the 'name' property on the 'SimpleUser' entity
        /// ```
        public var properties: [String: String] = [:]

        /// Rename query parameters
        public var parameters: [String: String] = [:]

        /// Rename enum cases
        public var enumCases: [String: String] = [:]

        /// Rename entities
        public var entities: [String: String] = [:]

        /// Rename operations when using the `"operations"` style for path generation
        public var operations: [String: String] = [:]

        /// Rename anynomous collection elements. By default, use a singularized form of the property name
        public var collectionElements: [String: String] = [:]
    }
}