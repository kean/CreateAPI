import XCTest
@testable import create_api

final class GenerateOptionsTests: GenerateTestCase {
    func testPetstoreReadsOverridesFromArguments() throws {
        try snapshot(
            spec: .petstore,
            name: "petstore-reads-overrides-from-arguments",
            arguments: [
                "--module", "PetstoreKit",
                "--generate", "entities",
                "--merge-sources",
                "--config-option", "entities.include=[Pet]",
                "--config-option", "entities.mutableProperties=false",
                "--config-option", "entities.filenameTemplate=Models.swift",
                "--config-option", "access=internal"
            ]
        )
    }

    func testPestoreOnlySchemas() throws {
        try snapshot(
            spec: .petstore,
            name: "petstore-only-schemas",
            arguments: [
                "--package", "petstore-only-schemas",
                "--generate", "entities"
            ]
        )
    }
    
    func testPetsStoreChangeEntityname() throws {
        try snapshot(
            spec: .petstore,
            name: "petstore-change-entityname",
            arguments: [
                "--package", "petstore-change-entityname",
                "--entityname-template", "%0Generated"
            ]
        )
    }
    
    func testPestoreSingleThreaded() throws {
        try snapshot(
            spec: .petstore,
            name: "petstore-single-threaded",
            arguments: [
                "--package", "petstore-single-threaded",
                "--single-threaded"
            ]
        )
    }
    
    func testPetstoreDisablePackages() throws {
        try snapshot(
            spec: .petstore,
            name: "petstore-no-package",
            arguments: [
                "--module", "Petstore"
            ]
        )
    }
    
    func testPetstoreMergeSources() throws {
        try snapshot(
            spec: .petstore,
            name: "petstore-merge-sources",
            arguments: [
                "--package", "petstore-merge-sources",
                "--merge-sources"
            ]
        )
    }
    
    func testPestoreAddCustomImport() throws {
        try snapshot(
            spec: .petstore,
            name: "petstore-custom-imports",
            testCompilationOnLinux: false, // custom imports aren't available there.
            arguments: [
                "--package", "petstore-custom-imports"
            ],
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
            arguments: [
                "--package", "petstore-generate-classes"
            ],
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
            arguments: [
                "--package", "petstore-some-entities-as-classes"
            ],
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
            arguments: [
                "--package", "petstore-some-entities-as-structs",
            ],
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
            arguments: [
                "--package", "petstore-base-class"
            ],
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
            arguments: [
                "--package", "petstore-disable-comments"
            ],
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
            arguments: [
                "--package", "petstore-disable-init-with-coder"
            ],
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
            arguments: [
                "--package", "petstore-disable-inlining"
            ],
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
            arguments: [
                "--package", "petstore-disable-mutable-properties",
                "--generate", "entities",
            ],
            configuration: """
            {
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
            arguments: [
                "--package", "petstore-enable-mutable-properties",
                "--generate", "entities",
            ],
            configuration: """
            {
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
            arguments: [
                "--package", "petstore-change-namespace-when-rest-style"
            ],
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
            arguments: [
                "--package", "petstore-change-namespace-when-operations-style"
            ],
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
            arguments: [
                "--package", "edgecases-change-access-control"
            ],
            configuration: """
            access: internal
            """
        )
    }
        
    func testEdgecasesRenameProperties() throws {
        try snapshot(
            spec: .edgecases,
            name: "edgecases-rename-properties",
            arguments: [
                "--package", "edgecases-rename-properties"
            ],
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
            arguments: [
                "--package", "edgecases-yaml-config"
            ],
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
            arguments: [
                "--package", "edgecases-disable-acronyms"
            ],
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
            arguments: [
                "--package", "edgecases-disable-enums"
            ],
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
            arguments: [
                "--package", "edgecases-rename"
            ],
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
            arguments: [
                "--package", "edgecases-tabs"
            ],
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
            arguments: [
                "--package", "edgecases-indent-with-two-width-spaces"
            ],
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
            arguments: [
                "--package", "edgecases-int32-int64"
            ],
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
            arguments: [
                "--package", "edgecases-coding-keys"
            ],
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
            arguments: [
                "--package", "strip-parent-name-nested-objects-enabled"
            ],
            configuration: """
            entities:
                stripParentNameInNestedObjects: true
            """
        )
    }  

    func testStripNamePrefixNestedObjects() throws {
        try snapshot(
            spec: .stripParentNameNestedObjects,
            name: "strip-parent-name-nested-objects-default",
            arguments: [
                "--package", "strip-parent-name-nested-objects-default"
            ]
        )
    }
    
    func testPetstoreIdentifiableEnabled() throws {
        try snapshot(
            spec: .petstore,
            name: "petstore-identifiable",
            arguments: [
                "--package", "petstore-identifiable",
                "--generate", "entities"
            ],
            configuration: """
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
            arguments: [
                "--package", "petstore-filename-template"
            ],
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
            arguments: [
                "--package", "petstore-entity-exclude",
                "--generate", "entities",
            ],
            configuration: """
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
    
    func testPetstoreSPMImports() throws {
        try snapshot(
            spec: .petstore,
            name: "petstore-SPM-imports",
            testCompilationOnLinux: false, // custom imports aren't available there.
            arguments: [
                "--package", "petstore-SPM-imports"
            ],
            configuration: """
            dependencies:
            - url: https://github.com/apple/swift-argument-parser
              module: ArgumentParser
              rule:
                exact:
                  version: 1.1.1
            - url: https://github.com/apple/swift-atomics
              module: Atomics
              rule:
                upToNextMajor:
                  from: 1.0.0
            - url: https://github.com/apple/swift-syntax
              module: SwiftSyntax
              rule:
                upToNextMinor:
                  from: 0.50600.1
            - url: https://github.com/apple/swift-algorithms
              module: Algorithms
              rule:
                range:
                  from: 1.0.0
                  to: 2.1.0
            - url: https://github.com/apple/swift-nio
              module: NIOCore
              rule:
                closedRange:
                  from: 2.41.1
                  to: 3.1.0
            - url: https://github.com/apple/swift-experimental-string-processing
              module: _StringProcessing
              rule:
               branch:
                 name: main
            - url: https://github.com/apple/swift-distributed-actors
              module: DistributedActors
              rule:
               commit:
                 hash: 9da657e933f7c302277eef373c4a0d74e90f2bfa
            """
        )
    }
}
