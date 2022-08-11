import XCTest
@testable import create_api

final class GenerateOptionsTests: GenerateTestCase {
    func testPetstoreReadsOverridesFromArguments() throws {
        try snapshot(
            spec: .petstore,
            name: "petstore-reads-overrides-from-arguments",
            arguments: [
                "--config-option", "entities.include=[Pet]",
                "--config-option", "entities.mutableProperties=false",
                "--config-option", "entities.filenameTemplate=Models.swift",
                "--config-option", "access=internal",
                "--config-option", "module=PetstoreKit"
            ],
            configuration: """
            generate: [entities]
            module: NotPetstoreKit
            mergeSources: true
            """
        )
    }

    func testPestoreOnlySchemas() throws {
        try snapshot(
            spec: .petstore,
            name: "petstore-only-schemas",
            configuration: """
            generate: [entities, package]
            """
        )
    }
    
    func testPetsStoreChangeEntityname() throws {
        try snapshot(
            spec: .petstore,
            name: "petstore-change-entityname",
            configuration: """
            entities:
              nameTemplate: "%0Generated"
            """
        )
    }
    
    func testPestoreSingleThreaded() throws {
        try snapshot(
            spec: .petstore,
            name: "petstore-single-threaded",
            arguments: [
                "--single-threaded"
            ]
        )
    }
    
    func testPetstoreDisablePackages() throws {
        try snapshot(
            spec: .petstore,
            name: "petstore-no-package",
            arguments: [
                "--config-option", "module=Petstore",
                "--config-option", "generate=[entities, paths]"
            ]
        )
    }
    
    func testPetstoreMergeSources() throws {
        try snapshot(
            spec: .petstore,
            name: "petstore-merge-sources",
            configuration: """
            mergeSources: true
            """
        )
    }
    
    func testPestoreAddCustomImport() throws {
        try snapshot(
            spec: .petstore,
            name: "petstore-custom-imports",
            testCompilationOnLinux: false, // custom imports aren't available there.
            configuration: """
            {
                "paths": {
                    "imports": ["Get", "HTTPHeaders", "CoreData"]
                },
                "entities": {
                    "imports": ["CoreLocation"]
                }
            }
            """
        )
    }
        
    func testPestoreGenerateClasses() throws {
        try snapshot(
            spec: .petstore,
            name: "petstore-generate-classes",
            configuration: """
            {
                "entities": {
                    "defaultType": "finalClass"
                }
            }
            """
        )
    }
    
    func testPestoreSomeEntitiesAsClasses() throws {
        try snapshot(
            spec: .petstore,
            name: "petstore-some-entities-as-classes",
            configuration: """
            {
                "entities": {
                    "typeOverrides": {
                        "Store": "finalClass"
                    }
                }
            }
            """
        )
    }
    
    func testPetstoreOverrideGenerateAsStructs() throws {
        try snapshot(
            spec: .petstore,
            name: "petstore-some-entities-as-structs",
            configuration: """
            {
                "entities": {
                    "defaultType": "finalClass",
                    "typeOverrides": {
                        "Error": "struct"
                    }
                }
            }
            """
        )
    }
    
    func testPetstoreBaseClass() throws {
        try snapshot(
            spec: .petstore,
            name: "petstore-base-class",
            configuration: """
            {
                "entities": {
                    "defaultType": "finalClass",
                    "baseClass": "NSObject"
                }
            }
            """
        )
    }
    
    func testPetstoreDisableCommentsGeneration() throws {
        try snapshot(
            spec: .petstore,
            name: "petstore-disable-comments",
            configuration: """
            {
                "commentOptions": false
            }
            """
        )
    }
    
    func testPetstoreDisableInitWithCoder() throws {
        try snapshot(
            spec: .petstore,
            name: "petstore-disable-init-with-coder",
            configuration: """
            {
                "entities": {
                    "alwaysIncludeDecodableImplementation": false
                }
            }
            """
        )
    }
    
    func testPetstoreDisableInlining() throws {
        try snapshot(
            spec: .petstore,
            name: "petstore-disable-inlining",
            configuration: """
            {
                "inlineTypealiases": false
            }
            """
        )
    }
    
    func testPetstoreDisableMutableProperties() throws {
        try snapshot(
            spec: .petstore,
            name: "petstore-disable-mutable-properties",
            configuration: """
            {
                "generate": ["entities", "package"],
                "entities": {
                    "typeOverrides": {
                        "Store": "finalClass"
                    },
                    "mutableProperties": false
                }
            }
            """
        )
    }
    
    func testPetstoreEnableMutableProperties() throws {
        try snapshot(
            spec: .petstore,
            name: "petstore-enable-mutable-properties",
            configuration: """
            {
                "generate": ["entities", "package"],
                "entities": {
                    "typeOverrides": {
                        "Store": "finalClass"
                    },
                    "mutableProperties": ["classes", "structs"],
                }
            }
            """
        )
    }

    func testPetstoreChangeNamespaceWhenRestStyle() throws {
        try snapshot(
            spec: .petstore,
            name: "petstore-change-namespace-when-rest-style",
            configuration: """
            {
                "paths": {
                    "style": "rest",
                    "namespace": "Namespace",
                }
            }
            """
        )
    }

    func testPetstoreChangeNamespaceWhenOperationsStyle() throws {
        try snapshot(
            spec: .petstore,
            name: "petstore-change-namespace-when-operations-style",
            configuration: """
            {
                "paths": {
                    "style": "operations",
                    "namespace": "Namespace",
                }
            }
            """
        )
    }
    
    func testPetstoreInternalAccessControl() throws {
        try snapshot(
            spec: .edgecases,
            name: "edgecases-change-access-control",
            configuration: """
            access: internal
            """
        )
    }
        
    func testEdgecasesRenameProperties() throws {
        try snapshot(
            spec: .edgecases,
            name: "edgecases-rename-properties",
            configuration: """
            {
                "rename": {
                    "properties": {
                        "id": "identifier",
                        "Category.name": "title",
                        "Pet.status": "state",
                        "complete": "isDone",
                    }
                }
            }
            """
        )
    }
    
    
    func testEdgecasesPassYAMLConfiguration() throws {
        try snapshot(
            spec: .edgecases,
            name: "edgecases-yaml-config",
            configuration: """
            rename:
                properties:
                    id: identifier
                    Category.name: title
                    Pet.status: state
                    complete: done
            """
        )
    }
                    
    func testEdgecasesDisableAcronyms() throws {
        try snapshot(
            spec: .edgecases,
            name: "edgecases-disable-acronyms",
            configuration: """
            {
                "acronyms": []
            }
            """
        )
    }
    
    func testEdgecasesDisableEnumGeneration() throws {
        try snapshot(
            spec: .edgecases,
            name: "edgecases-disable-enums",
            configuration: """
            {
                "generateEnums": false
            }
            """
        )
    }
    
    func testEdgecasesRename() throws {
        try snapshot(
            spec: .edgecases,
            name: "edgecases-rename",
            configuration: """
            {
                "rename": {
                    "properties": {
                        "ContainerA.Child.Child.rename-me": "onlyItRenamed"
                    },
                    "entities": {
                        "ApiResponse": "APIResponse",
                        "Status": "State"
                    }
                }
            }
            """
        )
    }
    
    func testEdgecasesIndentWithTabs() throws {
        try snapshot(
            spec: .edgecases,
            name: "edgecases-tabs",
            configuration: """
            {
                "indentation": "tabs"
            }
            """
        )
    }
    
    func testEdgecasesIndentWithTwoWidthSpaces() throws {
        try snapshot(
            spec: .edgecases,
            name: "edgecases-indent-with-two-width-spaces",
            configuration: """
            {
                "spaceWidth": 2
            }
            """
        )
    }
    
    func testEdgecasesEnableIntegerCapacity() throws {
        try snapshot(
            spec: .edgecases,
            name: "edgecases-int32-int64",
            configuration: """
            {
                "useFixWidthIntegers": true
            }
            """
        )
    }
    
    func testEdgecasesGenerateCodingKeys() throws {
        try snapshot(
            spec: .edgecases,
            name: "edgecases-coding-keys",
            configuration: """
            entities:
                optimizeCodingKeys: false
            """
        )
    }

    func testStripNamePrefixNestedObjectsEnabled() throws {
        try snapshot(
            spec: .stripParentNameNestedObjects,
            name: "strip-parent-name-nested-objects-enabled",
            configuration: """
            entities:
                stripParentNameInNestedObjects: true
            """
        )
    }  

    func testStripNamePrefixNestedObjects() throws {
        try snapshot(
            spec: .stripParentNameNestedObjects,
            name: "strip-parent-name-nested-objects-default"
        )
    }
    
    func testPetstoreIdentifiableEnabled() throws {
        try snapshot(
            spec: .petstore,
            name: "petstore-identifiable",
            configuration: """
            generate:
            - entities
            - package
            entities:
                includeIdentifiableConformance: true
            rename:
                properties:
                    Error.code: id
            """
        )
    }
    
    func testPetstoreFilenameTemplate() throws {
        try snapshot(
            spec: .petstore,
            name: "petstore-filename-template",
            configuration: """
            entities:
                filenameTemplate: "%0Model.swift"
            paths:
                filenameTemplate: "%0API.swift"
            """
        )
    }
    
    func testPetstoreEntityExclude() throws {
        try snapshot(
            spec: .petstore,
            name: "petstore-entity-exclude",
            configuration: """
            generate: [entities, package]
            entities:
                exclude:
                - Error
                - Pet.id
                - Store.pets
            rename:
                properties:
                    Pet.id: not_id
                    Pet.name: id
            """
        )
    }
}
