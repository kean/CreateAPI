import ConfigurationParser
import Foundation

// swiftlint:disable redundant_optional_initialization

// The `ConfigOptions` type defined in this source file serves multiple purposes:
//
// 1. A Decodable type that can deserialize the .create-api.yaml options
// 2. A reference for the default values of each option
// 3. The documentation for all options
//
// We use Sourcery to generate the CreateOptions.md document from this type.
// If you modify the ConfigOptions type below, be sure to run `make documentation`
// again from terminal and commit the changes. You will need sourcery installed.
//
// https://github.com/krzysztofzablocki/Sourcery
//
// To understand more about how sourcery works, check out the .sourcery.yml file
// as well as the templates in the Sourcery directory.

// sourcery: document, root
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
///   defaultType: class
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
public struct ConfigOptions: ParsableConfiguration {
    public init() { }

    public enum Generate: String, Codable {
        case entities, paths, enums, package
    }

    /// Different components that CreateAPI should generate.
    ///
    /// Available options are `.entities`, `.paths`, `.enums` and `.package`.
    /// Defaults to `[entities, paths, enums, package]`.
    @Option public var generate: Set<Generate> = [.entities, .paths, .enums, .package]

    /// The name of the module that the generated sources will be part of.
    ///
    /// You must specify a value for this option otherwise an error will be thrown when running the generator.
    @Option public var module: ModuleName = ""

    /// Merge generated Entities and Paths into single output files.
    ///
    /// Merging the source files offers a compact output, but prevents the compiler from parallelizing build tasks resulting in slower builds for larger schemas.
    @Option public var mergeSources = false

    public enum Vendor: String, Codable {
        case github
    }

    /// Enable vendor-specific logic (supported values: `github`)
    @Option public var vendor: Vendor? = nil

    /// Available access controls
    public enum Access: String, Codable {
        case `internal`, `public`
    }

    /// Access level modifier for all generated declarations
    /// - `public`
    /// - `internal`
    @Option public var access: Access = .public

    /// Add `@available(*, deprecated)` attribute to deprecated types and properties
    @Option public var annotateDeprecations: Bool = true

    /// Prefixes booleans with `is` ("enabled" -> "isEnabled")
    @Option public var useSwiftyPropertyNames: Bool = true

    /// Any schema that can be converted to a type identifier.
    /// For example, `typealias Pets = [Pet]` is inlined as `[Pet]`.
    @Option public var inlineTypealiases: Bool = true

    /// A list of acronyms that should be uppercased when present in property names.
    ///
    /// To disable uppercasing of acronyms, set this property to an empty array.
    ///
    /// <details>
    /// <summary>Examples</summary>
    ///
    /// With the given schema:
    ///
    /// ```yaml
    /// type: object
    /// properties:
    ///   user_id:
    ///     type: integer
    ///   image_url:
    ///     type: string
    ///     format: uri
    ///   acme_corporation:
    ///     type: boolean
    /// ```
    ///
    /// **No Acronyms**
    /// ```yaml
    /// acronyms: []
    /// ```
    ///
    /// ```swift
    /// var userId: Int
    /// var imageUrl: URL
    /// var isAcmeCorporation: Bool
    /// ```
    ///
    /// **Custom Acronyms**
    /// ```yaml
    /// acronyms:
    /// - id
    /// - url
    /// - acme
    /// ```
    ///
    /// ```swift
    /// var userID: Int
    /// var imageURL: URL
    /// var isACMECorporation: Bool
    /// ```
    ///
    /// </details>
    @Option public var acronyms: [String] = ["url", "id", "html", "ssl", "tls", "https", "http", "dns", "ftp", "api", "uuid", "json"]

    /// Available levels of indentation
    public enum Indentation: String, Codable {
        case spaces
        case tabs
    }

    /// Change the style of indentation. Supported values:
    /// - `spaces`
    /// - `tabs`
    @Option public var indentation: ConfigOptions.Indentation = .spaces

    /// Number of spaces to use when [`indentation`](#indentation) is set to `spaces`.
    @Option public var spaceWidth: Int = 4

    /// For example, `public var file: [File]` becomes `public var files: [File]`
    @Option public var pluralizeProperties: Bool = true

    /// Parses dates (e.g. `"2021-09-29"`) using [NaiveDate](https://github.com/CreateAPI/NaiveDate)
    @Option public var useNaiveDate: Bool = true

    /// Overrides file header comment
    @Option public var fileHeaderComment: String = "// Generated by Create API\n// https://github.com/CreateAPI/CreateAPI"

    public enum CommentOption: String, Codable, CaseIterable {
        case title, description, example, externalDocumentation, capitalized
    }

    /// Options used when generating comments.
    ///
    /// **Available options:**
    /// - `title` - Include the schema title (if available)
    /// - `description` - Include the schema description (if available)
    /// - `example` - Include the schema example value (if available)
    /// - `externalDocumentation` - Include a markdown formatted link to the schema's external documentation (if available)
    /// - `capitalized` - Automatically capitalize the comments
    ///
    /// To disable comments completely, set this property to an empty array.
    ///
    /// <details>
    /// <summary>Examples</summary>
    ///
    /// **Disable Comments**
    /// ```yaml
    /// commentOptions: [] # or false
    /// ```
    ///
    /// **Description Only**
    /// ```yaml
    /// commentOptions: description
    /// ```
    ///
    /// **Custom Comment**
    /// ```yaml
    /// commentOptions: [description, capitalized]
    /// ```
    ///
    ///
    /// **Detailed Comment** (default)
    /// ```yaml
    /// commentOptions:
    /// - title
    /// - description
    /// - example
    /// - externalDocumentation
    /// - capitalized
    /// ```
    ///
    /// </details>
    @Option @OptionSetDecodable public var commentOptions: Set<CommentOption> = [.title, .description, .example, .externalDocumentation, .capitalized]

    /// `true` if `commentOptions` have been defined
    public var commentsEnabled: Bool {
        !commentOptions.isEmpty
    }
    
    public struct DataTypes: Codable {
        public var string: [String: String]?
        public var number: [String: String]?
        public var integer: [String: String]?
    }
    
    /// Change the data type format mapping to Swift types than what CreateAPI provides.
    ///
    /// You can use this option in combination with [`entities.imports`](#entitiesimports), [`paths.imports`](#pathsimports), and [`package.dependencies`](#packagedependencies) for mapping to types that the default library does not provide.
    ///
    /// It is your responsibility to ensure that the replacement type conforms to `Codable` and can properly decode and encode to the original primative type.
    ///
    /// <details>
    /// <summary>Examples</summary>
    ///
    /// Supporting custom formats:
    /// ```yaml
    /// dataTypes:
    ///   string:
    ///     uuid: String
    ///     phone-number: PhoneNumber # imported type
    ///   number:
    ///     float: Double
    /// ```
    ///
    /// Disable fixed-width integer types:
    /// ```yaml
    /// dataTypes:
    ///   integer:
    ///     int32: Int
    ///     int64: Int
    /// ```
    ///
    /// Disable usage of `NaiveDate`:
    /// ```yaml
    /// useNaiveDate: false # must be set otherwise `date` overrides are ignored
    /// dataTypes:
    ///   string:
    ///     date: String
    /// ```
    ///
    /// </details>
    @Option public var dataTypes = DataTypes()
    
    @Option public var package: Package
    
    // sourcery: document,
    /// Options specifically related generated a Swift Package.
    public struct Package: ParsableConfiguration {
        public init() { }
        
        /// Additional remote Swift Package imports.
        ///
        /// <details>
        /// <summary>Examples</summary>
        ///
        /// ```yaml
        /// package:
        ///   dependencies:
        ///   - url: https://github.com/apple/swift-argument-parser
        ///     products:
        ///     - ArgumentParser
        ///     requirement:
        ///       exact:
        ///         version: 1.1.1
        ///   - url: https://github.com/apple/swift-algorithms
        ///     products:
        ///     - Algorithms
        ///     requirement:
        ///       range:
        ///         from: 1.0.0
        ///         to: 2.0.0
        ///   - url: https://github.com/apple/swift-metrics.git
        ///     products:
        ///     - Metrics
        ///     requirement:
        ///       closedRange:
        ///         from: 2.0.0
        ///         to: 2.9.1
        ///   - url: https://github.com/apple/swift-log
        ///     products:
        ///     - Logging
        ///     requirement:
        ///       branch:
        ///         name: main
        ///   - url: https://github.com/apple/swift-numerics
        ///     products:
        ///     - RealModule
        ///     - ComplexModule
        ///     requirement:
        ///       commit:
        ///         hash: 7f2d022d3d9b55bf812814f5d01896cbfa0fd4da
        ///   - url: https://github.com/apple/swift-system
        ///     products:
        ///     - SystemPackage
        ///     requirement:
        ///       from:
        ///         version: 1.2.1
        /// ```
        /// </details>
        @Option public var dependencies: [PackageDeclaration] = []
    }

    @Option public var entities: Entities

    // sourcery: document,
    /// Options specifically related to generating entities
    public struct Entities: ParsableConfiguration {
        public init() { }

        public enum EntityType: String, Codable {
            case `struct`, `class`, finalClass
        }

        /// The default type used when generating entities. Available options are `struct`, `class` or `finalClass`
        ///
        /// To override the default value for individual entities, use the [`typeOverrides`](#entitiestypeoverrides) option.
        ///
        /// > **Note**: If this value is set to `struct` but the entity cannot be represented as a struct (i.e when it contains a property that recursively contains itself), a warning will be logged and the type will generate as `finalClass` instead. You should explicitly handle this by using options such as [`typeOverrides`](#entitiestypeoverrides) or [`ignore`](#entitiesignore) instead.
        @Option public var defaultType: EntityType = .struct

        /// A dictionary map that describes entities that should generate as a specific type that wasn't the [`defaultType`](#entitiesdefaulttype)
        ///
        /// <details>
        /// <summary>Examples</summary>
        ///
        /// ```yaml
        /// entities:
        ///   defaultType: struct
        ///   typeOverrides:
        ///     Animal: class
        ///     Dog: finalClass
        /// ```
        ///
        /// ```yaml
        /// entities:
        ///   defaultType: finalClass
        ///   typeOverrides:
        ///     Animal: class
        /// ```
        ///
        /// </details>
        @Option public var typeOverrides: [String: EntityType] = [:]

        /// Modules to be imported within the source files for generated entities
        @Option public var imports: Set<String> = []

        public enum MutableProperties: String, CaseIterable, Codable {
            case structs, classes
        }

        /// Generate properties as mutable based on the type they are contained within.
        ///
        /// The default value is `structs` which means that structs will use mutable properties but classes won't.
        /// Set this property to `true` (or `[structs, classes]`) to always generate mutable properties and `false` (or `[]` to never generate mutable properties).
        ///
        /// <details>
        /// <summary>Examples</summary>
        ///
        /// **Structs Only**
        /// ```yaml
        /// entities:
        ///   mutableProperties: structs
        /// ```
        ///
        /// ```swift
        /// struct Foo {
        ///   var bar: String
        /// }
        ///
        /// class Foo {
        ///   let bar: String
        /// }
        /// ```
        ///
        /// **All Types**
        /// ```yaml
        /// entities:
        ///   mutableProperties: true # or [classes, structs]
        /// ```
        ///
        /// ```swift
        /// struct Foo {
        ///   var bar: String
        /// }
        ///
        /// class Foo1 {
        ///   var bar: String
        /// }
        /// ```
        ///
        /// </details>
        @Option @OptionSetDecodable public var mutableProperties: Set<MutableProperties> = [.structs]

        /// Base class used when generating `class` types
        @Option public var baseClass: String? = nil

        /// Protocols to be adopted by each generated entity
        @Option public var protocols: Set<String> = ["Codable"]

        /// Automatically generate `Identifiable` conformance for entities that include an `id` property.
        @Option public var includeIdentifiableConformance: Bool = false

        /// Automatically removes `Encodable` or `Decodable` conformance when it is not required
        @Option public var skipRedundantProtocols: Bool = true

        // TODO: simplify these three options
        /// Generate an initializer for each entity
        @Option public var includeInitializer: Bool = true

        // TODO: simplify this
        /// Generate the `init(from:)` initializer for `Decodable` conformance, even when the compiler synthesized version could be used.
        @Option public var alwaysIncludeDecodableImplementation: Bool = true

        // TODO: simplify this
        /// Generate the `encode(to:)` method for `Encodable` conformance, even when the compiler synthesized version could be used.
        @Option public var alwaysIncludeEncodableImplementation: Bool = true

        /// Orders properties of an entity alphabetically instead of the order defined in the schema
        @Option public var sortPropertiesAlphabetically: Bool = false

        /// When `true` (the default), uses a single `StringCodingKey` type allowing string literals to be used in the place of individual `CodingKey` enum types.
        ///
        /// For schemas with a large number of entities, this approach significantly reduces the binary size of the compiled code ([apple/swift#60287](https://github.com/apple/swift/issues/60287))
        @Option public var optimizeCodingKeys: Bool = true

        /// If set to `true`, uses the `default` value from the schema for the generated property for booleans
        @Option public var includeDefaultValues: Bool = true

        /// Controls the behaviour when generating entities from nested `allOf` schemas.
        ///
        /// <details>
        /// <summary>Examples</summary>
        ///
        /// With the following schema:
        ///
        /// ```yaml
        /// components:
        ///   schemas:
        ///     Animal:
        ///       properties:
        ///         numberOfLegs:
        ///           type: integer
        ///     Dog:
        ///       allOf:
        ///       - $ref: '#/components/schemas/Animal'
        ///       - type: object
        ///         properties:
        ///           goodBoy:
        ///             type: boolean
        /// ```
        ///
        /// When this property is set to `true` (the default):
        ///
        /// ```swift
        /// struct Animal: Codable {
        ///     var numberOfLegs: Int
        /// }
        ///
        /// struct Dog: Codable {
        ///     var numberOfLegs: Int
        ///     var isGoodBoy: Bool
        /// }
        /// ```
        ///
        /// However setting this property to `false` results results in the following:
        ///
        /// ```swift
        /// struct Animal: Codable {
        ///     var numberOfLegs: Int
        /// }
        ///
        /// struct Dog: Codable {
        ///     var animal: Animal
        ///     var isGoodBoy: Bool
        ///
        ///     // ...
        /// }
        /// ```
        ///
        /// </details>
        @Option public var inlineReferencedSchemas: Bool = true

        /// Strips the parent name of enum cases within objects that are `oneOf` / `allOf` / `anyOf` of nested references
        @Option public var stripParentNameInNestedObjects: Bool = false

        /// When set to a non-empty value, entities and entity properties with the given names will be ignored during generation.
        /// Cannot be used in conjunction with [`include`](#entitiesinclude).
        ///
        /// <details>
        /// <summary>Examples</summary>
        ///
        /// ```yaml
        /// entities:
        ///   exclude:
        ///   - Pet
        ///   - Store.id
        /// ```
        ///
        /// </details>
        @Option public var exclude: Set<EntityExclude> = []

        /// When set to a non-empty value, only entities matching the given names will be generated.
        /// This cannot be used in conjunction with [`exclude`](#entitiesexclude).
        @Option public var include: Set<String> = []

        /// A template used when generating entity names to allow for prefixing or suffixing.
        ///
        /// <details>
        /// <summary>Examples</summary>
        ///
        /// ```yaml
        /// entities:
        ///   nameTemplate: "%0DTO" # PetDTO, StoreDTO, ErrorDTO
        /// ```
        ///
        /// ```yaml
        /// entities:
        ///   nameTemplate: "_%0" # _Pet, _Store, _Error
        /// ```
        ///
        /// </details>
        @Option public var nameTemplate: String = "%0"

        /// Template to use for Entity file generation
        ///
        /// <details>
        /// <summary>Examples</summary>
        ///
        /// ```yaml
        /// entities:
        ///   filenameTemplate: "%0Model.swift"
        /// ```
        ///
        /// </details>
        @Option public var filenameTemplate: String = "%0.swift"
    }

    @Option public var paths: Paths

    public enum PathsStyle: String, Codable {
        case rest
        case operations
    }

    // sourcery: document
    /// Options specifically related to generating paths
    public struct Paths: ParsableConfiguration {
        public init() { }

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
        @Option public var style: ConfigOptions.PathsStyle = .rest

        /// The namespace type for all generated paths
        @Option public var namespace: String = "Paths"

        /// Generate response headers using [HTTPHeaders](https://github.com/CreateAPI/HTTPHeaders)
        @Option public var includeResponseHeaders: Bool = true

        /// Modules to be imported within the source files for generated requests
        @Option public var imports: Set<String> = ["Get"]

        /// Allows you to override mapping of specific response types to a custom (or generated) type instead.
        ///
        /// For example:
        ///
        /// ```yaml
        /// paths:
        ///   overriddenResponses:
        ///     MyApiResponseType: MyCustomDecodableType
        /// ```
        @Option public var overriddenResponses: [String: String] = [:]

        /// Tell CreateAPI how to map an unknown request or response content types to a Swift type used in the path generation.
        ///
        /// For example:
        ///
        /// ```yaml
        /// paths:
        ///   overriddenBodyTypes:
        ///     application/octocat-stream: String
        /// ```
        @Option public var overriddenBodyTypes: [String: String] = [:]

        /// Inline simple requests, like the ones with a single parameter
        @Option public var inlineSimpleRequests: Bool = true

        /// Inline query parameters for simple requests instead of generating a Parameter type
        @Option public var inlineSimpleQueryParameters: Bool = true

        /// The threshold of query parameters to inline when using `inlineSimpleQueryParameters`.
        @Option public var simpleQueryParametersThreshold: Int = 2

        // TODO: Replace this with a better solution for patch params
        // sourcery: skip
        @Option public var makeOptionalPatchParametersDoubleOptional: Bool = false

        /// Remove redundant paths if possible
        @Option public var removeRedundantPaths: Bool = true

        /// When set to a non-empty value, the given paths will be ignored during generation.
        /// Cannot be used in conjunction with [`include`](#pathsinclude).
        @Option public var exclude: Set<String> = []

        /// When set to a non-empty value, only the given paths will be generated.
        /// This cannot be used in conjunction with [`exclude`](#pathsexclude).
        @Option public var include: Set<String> = []

        /// Template to use for Paths file generation.
        ///
        /// <details>
        /// <summary>Examples</summary>
        ///
        /// ```yaml
        /// paths:
        ///   filenameTemplate: "%0API.swift"
        /// ```
        ///
        /// </details>
        @Option public var filenameTemplate: String = "%0.swift"

        /// If `false`, CreateAPI generates request body structures for "multipart/form-data" format just like it would for "application/json".
        /// Otherwise the `body` of the generated `Request` will use `Data`. The default value is `true`.
        ///
        /// When using Get and it's `APIClient`, because Multipart Form Data isn't supported from the `Request` `body` property, it is best to leave this option set to `true`.
        /// If however you have implemented your API Client, and you prefer to use structured `Codable` types to encode a Multipart Form Data request body, setting this value to `false` can be more convenient.
        /// You might also need to use the [`dataTypes`](#datatypes) option to customise the type used to represent `binary` data.
        @Option public var useDataForMultipartFormDataRequestBody: Bool = true
    }

    @Option public var rename: Rename

    // sourcery: document
    /// Options used to configure detailed renaming rules for all aspects of the generated code.
    public struct Rename: ParsableConfiguration {
        public init() { }

        /// Rename schema properties prior to processing. Rules can apply to all properties or to
        /// properties of a specific entity.
        ///
        /// <details>
        /// <summary>Examples</summary>
        ///
        /// ```yaml
        /// rename:
        ///   properties:
        ///     favorite_food: food # renames any schema property called 'favorite_food` to food
        ///     User.first_name: name # renames only the 'first_name` schema property on the `User` entity
        /// ```
        ///
        /// </details>
        @Option public var properties: [String: String] = [:]

        /// Rename query parameters
        @Option public var parameters: [String: String] = [:]

        /// Rename enum cases
        @Option public var enumCases: [String: String] = [:]

        /// Rename entities
        @Option public var entities: [String: String] = [:]

        /// Rename operations when using the `"operations"` style for path generation
        @Option public var operations: [String: String] = [:]

        /// Rename anonymous collection elements. By default, use a singularized form of the property name
        @Option public var collectionElements: [String: String] = [:]

        /// Whether the renames should be sanitized when processed, removing reserved keywords and such
        @Option public var sanitizeRenames: Bool = true
    }
}

// MARK: - Utilities
public extension ConfigOptions.Entities {
    /// The preferred type of a given entity (based on name) as per the configuration.
    func preferredType(of entity: String) -> EntityType {
        typeOverrides[entity] ?? defaultType
    }
}
