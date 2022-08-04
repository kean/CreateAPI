// Generated using Sourcery 1.8.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

// swiftlint:disable all

extension ConfigOptions: Decodable {
    enum KnownKeys: String {
        case access
        case isAddingDeprecations
        case isGeneratingEnums
        case isGeneratingSwiftyBooleanPropertyNames
        case isInliningTypealiases
        case isReplacingCommonAcronyms
        case addedAcronyms
        case ignoredAcronyms
        case indentation
        case spaceWidth
        case isPluralizationEnabled
        case isNaiveDateEnabled
        case isUsingIntegersWithPredefinedCapacity
        case isSwiftLintDisabled
        case fileHeaderComment
        case comments
        case entities
        case paths
        case rename
    }

    public init(from decoder: Decoder) throws {
        let container = try StringCodingContainer<KnownKeys>(decoder: decoder)

        access = try container.decode(String.self,
            forKey: .access,
            defaultValue: "public"
        )

        isAddingDeprecations = try container.decode(Bool.self,
            forKey: .isAddingDeprecations,
            defaultValue: true
        )

        isGeneratingEnums = try container.decode(Bool.self,
            forKey: .isGeneratingEnums,
            defaultValue: true
        )

        isGeneratingSwiftyBooleanPropertyNames = try container.decode(Bool.self,
            forKey: .isGeneratingSwiftyBooleanPropertyNames,
            defaultValue: true
        )

        isInliningTypealiases = try container.decode(Bool.self,
            forKey: .isInliningTypealiases,
            defaultValue: true
        )

        isReplacingCommonAcronyms = try container.decode(Bool.self,
            forKey: .isReplacingCommonAcronyms,
            defaultValue: true
        )

        addedAcronyms = try container.decode([String].self,
            forKey: .addedAcronyms,
            defaultValue: []
        )

        ignoredAcronyms = try container.decode([String].self,
            forKey: .ignoredAcronyms,
            defaultValue: []
        )

        indentation = try container.decode(ConfigOptions.Indentation.self,
            forKey: .indentation,
            defaultValue: .spaces
        )

        spaceWidth = try container.decode(Int.self,
            forKey: .spaceWidth,
            defaultValue: 4
        )

        isPluralizationEnabled = try container.decode(Bool.self,
            forKey: .isPluralizationEnabled,
            defaultValue: true
        )

        isNaiveDateEnabled = try container.decode(Bool.self,
            forKey: .isNaiveDateEnabled,
            defaultValue: true
        )

        isUsingIntegersWithPredefinedCapacity = try container.decode(Bool.self,
            forKey: .isUsingIntegersWithPredefinedCapacity,
            defaultValue: false
        )

        isSwiftLintDisabled = try container.decode(Bool.self,
            forKey: .isSwiftLintDisabled,
            defaultValue: true
        )

        fileHeaderComment = try container.decode(String.self,
            forKey: .fileHeaderComment,
            defaultValue: "// Generated by Create API\n// https://github.com/CreateAPI/CreateAPI"
        )

        comments = try container.decode(Comments.self,
            forKey: .comments,
            defaultValue: .init()
        )

        entities = try container.decode(Entities.self,
            forKey: .entities,
            defaultValue: .init()
        )

        paths = try container.decode(Paths.self,
            forKey: .paths,
            defaultValue: .init()
        )

        rename = try container.decode(Rename.self,
            forKey: .rename,
            defaultValue: .init()
        )

        container.recordPotentialIssues(
            deprecations: [
            ],
            replacements: [
            ]
        )
    }
}

extension ConfigOptions.Comments: Decodable {
    enum KnownKeys: String {
        case isEnabled
        case isAddingTitles
        case isAddingDescription
        case isAddingExamples
        case isAddingExternalDocumentation
        case isCapitalizationEnabled
    }

    public init(from decoder: Decoder) throws {
        let container = try StringCodingContainer<KnownKeys>(decoder: decoder)

        isEnabled = try container.decode(Bool.self,
            forKey: .isEnabled,
            defaultValue: true
        )

        isAddingTitles = try container.decode(Bool.self,
            forKey: .isAddingTitles,
            defaultValue: true
        )

        isAddingDescription = try container.decode(Bool.self,
            forKey: .isAddingDescription,
            defaultValue: true
        )

        isAddingExamples = try container.decode(Bool.self,
            forKey: .isAddingExamples,
            defaultValue: true
        )

        isAddingExternalDocumentation = try container.decode(Bool.self,
            forKey: .isAddingExternalDocumentation,
            defaultValue: true
        )

        isCapitalizationEnabled = try container.decode(Bool.self,
            forKey: .isCapitalizationEnabled,
            defaultValue: true
        )

        container.recordPotentialIssues(
            deprecations: [
            ],
            replacements: [
            ]
        )
    }
}

extension ConfigOptions.Entities: Decodable {
    enum KnownKeys: String {
        case isGeneratingStructs
        case entitiesGeneratedAsClasses
        case entitiesGeneratedAsStructs
        case imports
        case isMakingClassesFinal
        case isGeneratingMutableClassProperties
        case isGeneratingMutableStructProperties
        case baseClass
        case protocols
        case isGeneratingIdentifiableConformance
        case isSkippingRedundantProtocols
        case isGeneratingInitializers
        case isGeneratingInitWithDecoder
        case isGeneratingEncodeWithEncoder
        case isSortingPropertiesAlphabetically
        case isGeneratingCustomCodingKeys
        case isAddingDefaultValues
        case isInliningPropertiesFromReferencedSchemas
        case isAdditionalPropertiesOnByDefault
        case isStrippingParentNameInNestedObjects
        case exclude
        case include
    }

    public init(from decoder: Decoder) throws {
        let container = try StringCodingContainer<KnownKeys>(decoder: decoder)

        isGeneratingStructs = try container.decode(Bool.self,
            forKey: .isGeneratingStructs,
            defaultValue: true
        )

        entitiesGeneratedAsClasses = try container.decode(Set<String>.self,
            forKey: .entitiesGeneratedAsClasses,
            defaultValue: []
        )

        entitiesGeneratedAsStructs = try container.decode(Set<String>.self,
            forKey: .entitiesGeneratedAsStructs,
            defaultValue: []
        )

        imports = try container.decode(Set<String>.self,
            forKey: .imports,
            defaultValue: []
        )

        isMakingClassesFinal = try container.decode(Bool.self,
            forKey: .isMakingClassesFinal,
            defaultValue: true
        )

        isGeneratingMutableClassProperties = try container.decode(Bool.self,
            forKey: .isGeneratingMutableClassProperties,
            defaultValue: false
        )

        isGeneratingMutableStructProperties = try container.decode(Bool.self,
            forKey: .isGeneratingMutableStructProperties,
            defaultValue: true
        )

        baseClass = try container.decode(String?.self,
            forKey: .baseClass,
            defaultValue: nil
        )

        protocols = try container.decode(Set<String>.self,
            forKey: .protocols,
            defaultValue: ["Codable"]
        )

        isGeneratingIdentifiableConformance = try container.decode(Bool.self,
            forKey: .isGeneratingIdentifiableConformance,
            defaultValue: false
        )

        isSkippingRedundantProtocols = try container.decode(Bool.self,
            forKey: .isSkippingRedundantProtocols,
            defaultValue: true
        )

        isGeneratingInitializers = try container.decode(Bool.self,
            forKey: .isGeneratingInitializers,
            defaultValue: true
        )

        isGeneratingInitWithDecoder = try container.decode(Bool.self,
            forKey: .isGeneratingInitWithDecoder,
            defaultValue: true
        )

        isGeneratingEncodeWithEncoder = try container.decode(Bool.self,
            forKey: .isGeneratingEncodeWithEncoder,
            defaultValue: true
        )

        isSortingPropertiesAlphabetically = try container.decode(Bool.self,
            forKey: .isSortingPropertiesAlphabetically,
            defaultValue: false
        )

        isGeneratingCustomCodingKeys = try container.decode(Bool.self,
            forKey: .isGeneratingCustomCodingKeys,
            defaultValue: true
        )

        isAddingDefaultValues = try container.decode(Bool.self,
            forKey: .isAddingDefaultValues,
            defaultValue: true
        )

        isInliningPropertiesFromReferencedSchemas = try container.decode(Bool.self,
            forKey: .isInliningPropertiesFromReferencedSchemas,
            defaultValue: false
        )

        isAdditionalPropertiesOnByDefault = try container.decode(Bool.self,
            forKey: .isAdditionalPropertiesOnByDefault,
            defaultValue: true
        )

        isStrippingParentNameInNestedObjects = try container.decode(Bool.self,
            forKey: .isStrippingParentNameInNestedObjects,
            defaultValue: false
        )

        exclude = try container.decode(Set<String>.self,
            forKey: .exclude,
            defaultValue: []
        )

        include = try container.decode(Set<String>.self,
            forKey: .include,
            defaultValue: []
        )

        container.recordPotentialIssues(
            deprecations: [
            ],
            replacements: [
            ]
        )
    }
}

extension ConfigOptions.Paths: Decodable {
    enum KnownKeys: String {
        case style
        case namespace
        case generateResponseHeaders
        case isAddingOperationIds
        case imports
        case overriddenResponses
        case overriddenBodyTypes
        case inlineSimpleRequests
        case inlineSimpleQueryParameters
        case simpleQueryParametersThreshold
        case makeOptionalPatchParametersDoubleOptional
        case isRemovingRedundantPaths
        case exclude
        case include
    }

    public init(from decoder: Decoder) throws {
        let container = try StringCodingContainer<KnownKeys>(decoder: decoder)

        style = try container.decode(ConfigOptions.PathsStyle.self,
            forKey: .style,
            defaultValue: .rest
        )

        namespace = try container.decode(String.self,
            forKey: .namespace,
            defaultValue: "Paths"
        )

        generateResponseHeaders = try container.decode(Bool.self,
            forKey: .generateResponseHeaders,
            defaultValue: true
        )

        isAddingOperationIds = try container.decode(Bool.self,
            forKey: .isAddingOperationIds,
            defaultValue: false
        )

        imports = try container.decode(Set<String>.self,
            forKey: .imports,
            defaultValue: ["Get"]
        )

        overriddenResponses = try container.decode([String: String].self,
            forKey: .overriddenResponses,
            defaultValue: [:]
        )

        overriddenBodyTypes = try container.decode([String: String].self,
            forKey: .overriddenBodyTypes,
            defaultValue: [:]
        )

        inlineSimpleRequests = try container.decode(Bool.self,
            forKey: .inlineSimpleRequests,
            defaultValue: true
        )

        inlineSimpleQueryParameters = try container.decode(Bool.self,
            forKey: .inlineSimpleQueryParameters,
            defaultValue: true
        )

        simpleQueryParametersThreshold = try container.decode(Int.self,
            forKey: .simpleQueryParametersThreshold,
            defaultValue: 2
        )

        makeOptionalPatchParametersDoubleOptional = try container.decode(Bool.self,
            forKey: .makeOptionalPatchParametersDoubleOptional,
            defaultValue: false
        )

        isRemovingRedundantPaths = try container.decode(Bool.self,
            forKey: .isRemovingRedundantPaths,
            defaultValue: true
        )

        exclude = try container.decode(Set<String>.self,
            forKey: .exclude,
            defaultValue: []
        )

        include = try container.decode(Set<String>.self,
            forKey: .include,
            defaultValue: []
        )

        container.recordPotentialIssues(
            deprecations: [
            ],
            replacements: [
                ("isGeneratingResponseHeaders", "Use 'generateResponseHeaders' instead."),
                ("overridenResponses", "Use 'overriddenResponses' instead."),
                ("overridenBodyTypes", "Use 'overriddenBodyTypes' instead."),
                ("isInliningSimpleRequests", "Use 'inlineSimpleRequests' instead."),
                ("isInliningSimpleQueryParameters", "Use 'inlineSimpleQueryParameters' instead."),
                ("isMakingOptionalPatchParametersDoubleOptional", "Use 'makeOptionalPatchParametersDoubleOptional' instead."),
            ]
        )
    }
}

extension ConfigOptions.Rename: Decodable {
    enum KnownKeys: String {
        case properties
        case parameters
        case enumCases
        case entities
        case operations
        case collectionElements
    }

    public init(from decoder: Decoder) throws {
        let container = try StringCodingContainer<KnownKeys>(decoder: decoder)

        properties = try container.decode([String: String].self,
            forKey: .properties,
            defaultValue: [:]
        )

        parameters = try container.decode([String: String].self,
            forKey: .parameters,
            defaultValue: [:]
        )

        enumCases = try container.decode([String: String].self,
            forKey: .enumCases,
            defaultValue: [:]
        )

        entities = try container.decode([String: String].self,
            forKey: .entities,
            defaultValue: [:]
        )

        operations = try container.decode([String: String].self,
            forKey: .operations,
            defaultValue: [:]
        )

        collectionElements = try container.decode([String: String].self,
            forKey: .collectionElements,
            defaultValue: [:]
        )

        container.recordPotentialIssues(
            deprecations: [
            ],
            replacements: [
            ]
        )
    }
}

