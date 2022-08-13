import ConfigurationParser
import Foundation

extension Issue {
    static func warnings(for issues: [Issue]) -> [String] {
        return issues.map { issue in
            // If the issue is unexpected because we removed it, provide better guidance.
            if case .unexpectedOption(let name, let context) = issue,
               let message = removedOptions[context.codingPath + [name]] {

                let propertyName = name.formattedAsQuote(in: context.codingPath)
                return "Property \(propertyName) has been removed. \(message)"
            }

            // Otherwise just use the default warning message.
            return issue.description
        }
    }

    // The following dictionary contains a list of properties that have been
    // completely removed from CreateAPI. Usually we wouldn't make so much
    // effort to cover this kind of scenario since we'd gradually deprecate
    // options. During the prerelease however, we are a bit more aggressive.
    //
    // If you want to add more useful migration information for specific
    // properties that have been completely removed, add to this list.
    //
    // The message will be printed as an error or warning when the user runs
    // create-api if their configuration contains one of the options still.
    static let removedOptions: [[Name]: String] = [
        ["isAddingDeprecations"]: "Replaced by ‘annotateDeprecations‘.",
        ["isGeneratingEnums"]: "Replaced by ‘generate‘.",
        ["isGeneratingSwiftyBooleanPropertyNames"]: "Replaced by ‘useSwiftyPropertyNames‘.",
        ["isInliningTypealiases"]: "Replaced by ‘inlineTypealiases‘.",
        ["isPluralizationEnabled"]: "Replaced by ‘pluralizeProperties‘.",
        ["isNaiveDateEnabled"]: "Replaced by ‘useNaiveDate‘.",
        ["isUsingIntegersWithPredefinedCapacity"]: "Replaced by ‘useFixWidthIntegers‘.",
        ["comments"]: "Replaced by ‘commentOptions‘.",
        ["isSwiftLintDisabled"]: "Add to ‘fileHeaderComment‘ instead.",
        ["isReplacingCommonAcronyms"]: "Replaced by ‘acronyms‘.",
        ["addedAcronyms"]: "Replaced by ‘acronyms‘.",
        ["ignoredAcronyms"]: "Replaced by ‘acronyms‘.",
        ["entities", "isGeneratingIdentifiableConformance"]: "Replaced By ‘includeIdentifiableConformance‘.",
        ["entities", "isSkippingRedundantProtocols"]: "Replaced By ‘skipRedundantProtocols‘.",
        ["entities", "isGeneratingInitializers"]: "Replaced By ‘includeInitializer‘.",
        ["entities", "isGeneratingInitWithDecoder"]: "Replaced By ‘alwaysIncludeDecodableImplementation‘.",
        ["entities", "isGeneratingEncodeWithEncoder"]: "Replaced By ‘alwaysIncludeEncodableImplementation‘.",
        ["entities", "isSortingPropertiesAlphabetically"]: "Replaced By ‘sortPropertiesAlphabetically‘.",
        ["entities", "isGeneratingCustomCodingKeys"]: "Replaced By ‘optimizeCodingKeys‘.",
        ["entities", "isAddingDefaultValues"]: "Replaced By ‘includeDefaultValues‘.",
        ["entities", "isInliningPropertiesFromReferencedSchemas"]: "Replaced By ‘inlineReferencedSchemas‘.",
        ["entities", "isStrippingParentNameInNestedObjects"]: "Replaced By ‘stripParentNameInNestedObjects‘.",
        ["entities", "isAdditionalPropertiesOnByDefault"]: "Enabled by default.",
        ["entities", "isGeneratingMutableClassProperties"]: "Replaced by ‘mutableProperties‘",
        ["entities", "isGeneratingMutableStructProperties"]: "Replaced by ‘mutableProperties‘",
        ["entities", "isGeneratingStructs"]: "Replaced by ‘defaultType‘",
        ["entities", "isMakingClassesFinal"]: "Replaced by ‘defaultType‘",
        ["entities", "entitiesGeneratedAsClasses"]: "Replaced by ‘typeOverrides‘",
        ["entities", "entitiesGeneratedAsStructs"]: "Replaced by ‘typeOverrides‘",
        ["paths", "isGeneratingResponseHeaders"]: "Replaced by ‘includeResponseHeaders‘.",
        ["paths", "overridenResponses"]: "Replaced by ‘overriddenResponses‘.",
        ["paths", "overridenBodyTypes"]: "Replaced by ‘overriddenBodyTypes‘.",
        ["paths", "isInliningSimpleRequests"]: "Replaced by ‘inlineSimpleRequests‘.",
        ["paths", "isInliningSimpleQueryParameters"]: "Replaced by ‘inlineSimpleQueryParameters‘.",
        ["paths", "isMakingOptionalPatchParametersDoubleOptional"]: "Replaced by ‘makeOptionalPatchParametersDoubleOptional‘.",
        ["paths", "isRemovingRedundantPaths"]: "Replaced by ‘removeRedundantPaths‘.",
        ["paths", "isAddingOperationIds"]: "Enabled by default."
    ]
}
