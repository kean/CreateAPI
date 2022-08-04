import Foundation

// swiftlint:disable redundant_optional_initialization

// The `ConfigOptions` type defined in this source file serves multiple purposes:
//
// 1. A Decodable type that can deserialize the .create-api.yaml options
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
/// **.create-api.yaml**:
///
/// ```yaml
/// access: internal
/// fileHeaderComment: |
///   // Generated by Create API
///   // https://github.com/CreateAPI/CreateAPI
/// entities:
///   generateStructs: false
///   includeInitializer: false
/// paths:
///   style: operations
/// ```
///
/// **.create-api.json**:
///
/// ```json
/// {
///   "access": "internal",
///   "fileHeaderComment": "// Generated by Create API\n// https://github.com/CreateAPI/CreateAPI\n",
///   "entities": {
///     "generateStructs": false,
///     "includeInitializer": false
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
    public var annotateDeprecations: Bool = true // sourcery: replacementFor = isAddingDeprecations

    /// Generate enums for strings
    public var generateEnums: Bool = true // sourcery: replacementFor = isGeneratingEnums

    /// Prefixes booleans with `is` ("enabled" -> "isEnabled")
    public var useSwiftyPropertyNames: Bool = true // sourcery: replacementFor = isGeneratingSwiftyBooleanPropertyNames

    /// Any schema that can be converted to a type identifier.
    /// For example, `typealias Pets = [Pet]` is inlined as `[Pet]`.
    public var inlineTypealiases: Bool = true // sourcery: replacementFor = isInliningTypealiases

    /// For example, `var sourceUrl` becomes `var sourceURL`.
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

    /// Number of spaces to use when [`indentation`](#indentation) is set to `spaces`.
    public var spaceWidth: Int = 4

    /// For example, `public var file: [File]` becomes `public var files: [File]`
    public var pluralizeProperties: Bool = true // sourcery: replacementFor = isPluralizationEnabled

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
        /// Set to false to disable the generation of comments
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
        public var generateStructs: Bool = true // sourcery: replacementFor = isGeneratingStructs

        /// Explicitly generate the following entities as `class` types
        public var entitiesGeneratedAsClasses: Set<String> = []

        /// Explicitly generate the given entities as `struct` types
        public var entitiesGeneratedAsStructs: Set<String> = []

        /// Modules to be imported within the source files for generated entities
        public var imports: Set<String> = []

        /// When generating `class` types, marks them as `final`
        public var finalClasses: Bool = true // sourcery: replacementFor = isMakingClassesFinal

        /// When generating `class` types, generate the properties as `public var`
        public var mutableClassProperties: Bool = false // sourcery: replacementFor = isGeneratingMutableClassProperties

        /// When generating `struct` types, generate the properties as `public var`
        public var mutableStructProperties: Bool = true // sourcery: replacementFor = isGeneratingMutableStructProperties

        /// Base class used when generating `class` types
        public var baseClass: String? = nil

        /// Protocols to be adopted by each generated entity
        public var protocols: Set<String> = ["Codable"]

        /// Automatically generate `Identifiable` conformance for entities that include an `id` property.
        public var identifiableConformance: Bool = false // sourcery: replacementFor = isGeneratingIdentifiableConformance

        /// Automatically removes `Encodable` or `Decodable` conformance when it is not required
        public var skipRedundantProtocols: Bool = true // sourcery: replacementFor = isSkippingRedundantProtocols

        // TODO: simplify these three options
        /// Generate an initializer for each entity
        public var includeInitializer: Bool = true // sourcery: replacementFor = isGeneratingInitializers

        // TODO: simplify this
        /// Generate the `init(from:)` initializer for `Decodable` conformance, even when the compiler synthesized version could be used.
        public var alwaysIncludeDecodableImplementation: Bool = true // sourcery: replacementFor = isGeneratingInitWithDecoder

        // TODO: simplify this
        /// Generate the `encode(to:)` method for `Encodable` conformance, even when the compiler synthesized version could be used.
        public var alwaysIncludeEncodableImplementation: Bool = true // sourcery: replacementFor = isGeneratingEncodeWithEncoder

        /// Orders properties of an entity alphabetically instead of the order defined in the schema
        public var sortPropertiesAlphabetically: Bool = false // sourcery: replacementFor = isSortingPropertiesAlphabetically

        /// When `true`, uses a single `StringCodingKey` type allowing string literals to be used in the place of individual `CodingKey` enum types.
        ///
        /// For schemas with a large number of entities, this approach significantly reduces the binary size of the compiled code ([apple/swift#60287](https://github.com/apple/swift/issues/60287))
        public var optimizeCodingKeys: Bool = false // sourcery: replacementFor = isGeneratingCustomCodingKeys

        /// If set to `true`, uses the `default` value from the schema for the generated property for booleans
        public var defaultValues: Bool = true // sourcery: replacementFor = isAddingDefaultValues

        // TODO: Improve this documentation
        /// For `allOf` inline properties from references
        public var inlineReferencedSchemas: Bool = false // sourcery: replacementFor = isInliningPropertiesFromReferencedSchemas

        /// Changes how unspecified additional properties are interpreted
        public var isAdditionalPropertiesOnByDefault: Bool = true

        /// Strips the parent name of enum cases within objects that are `oneOf` / `allOf` / `anyOf` of nested references
        public var stripParentNameInNestedObjects: Bool = false // sourcery: replacementFor = isStrippingParentNameInNestedObjects

        /// When set to a non-empty value, entities with the given names will be ignored during generation.
        /// Cannot be used in conjunction with [`include`](#entitiesinclude).
        public var exclude: Set<String> = []

        /// When set to a non-empty value, only entities matching the given names will be generated.
        /// This cannot be used in conjunction with [`exclude`](#entitiesexclude).
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
        ///
        /// <details>
        /// <summary>Examples</summary>
        ///
        /// **Rest**
        /// ```swift
        /// // Uses namespaces and names based on the path for each request
        /// Paths.pets.get(limit: nil) // GET /pets
        /// Paths.pets.petID("1").get // GET /pets/1
        /// ```
        ///
        /// **Operations**
        /// ```swift
        /// // Uses the `operationId` defined in the schema for each request
        /// Paths.listPets(limit: nil) // GET /pets
        /// Paths.showPetById(petID: "1") // GET /pets/1
        /// ```
        ///
        /// </details>
        public var style: ConfigOptions.PathsStyle = .rest

        /// The namespace type for all generated paths
        public var namespace: String = "Paths"

        /// Generate response headers using [HTTPHeaders](https://github.com/CreateAPI/HTTPHeaders)
        public var generateResponseHeaders: Bool = true // sourcery: replacementFor = isGeneratingResponseHeaders

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
        ///   overriddenResponses:
        ///     MyApiResponseType: MyCustomDecodableType
        /// ```
        public var overriddenResponses: [String: String] = [:] // sourcery: replacementFor = overridenResponses

        /// Tell CreateAPI how to map an unknown request or response content types to a Swift type used in the path generation.
        ///
        /// For example:
        ///
        /// ```yaml
        /// paths:
        ///   overriddenBodyTypes:
        ///     application/octocat-stream: String
        /// ```
        public var overriddenBodyTypes: [String: String] = [:] // sourcery: replacementFor = overridenBodyTypes

        /// Inline simple requests, like the ones with a single parameter
        public var inlineSimpleRequests: Bool = true // sourcery: replacementFor = isInliningSimpleRequests

        /// Inline query parameters for simple requests instead of generating a Parameter type
        public var inlineSimpleQueryParameters: Bool = true // sourcery: replacementFor = isInliningSimpleQueryParameters

        /// The threshold of query parameters to inline when using `inlineSimpleQueryParameters`.
        public var simpleQueryParametersThreshold: Int = 2

        // TODO: Replace this with a better solution for patch params
        // sourcery: skip
        public var makeOptionalPatchParametersDoubleOptional: Bool = false // sourcery: replacementFor = isMakingOptionalPatchParametersDoubleOptional

        /// Remove redundant paths if possible
        public var removeRedundantPaths: Bool = true // sourcery: replacementFor = isRemovingRedundantPaths

        /// When set to a non-empty value, the given paths will be ignored during generation.
        /// Cannot be used in conjunction with [`include`](#pathsinclude).
        public var exclude: Set<String> = []

        /// When set to a non-empty value, only the given paths will be generated.
        /// This cannot be used in conjunction with [`exclude`](#pathsexclude).
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

        /// Rename anonymous collection elements. By default, use a singularized form of the property name
        public var collectionElements: [String: String] = [:]
    }
}
