import XCTest
@testable import create_api

final class GenerateOptionsTests: GenerateBaseTests {
    func testPestoreOnlySchemas() throws {
        // GIVEN
        let command = try Generate.parse([
            pathForSpec(named: "petstore", ext: "yaml"),
            "--output", temp.url.path,
            "--package", "petstore-only-schemas",
            "--generate", "entities"
        ])
        
        // WHEN
        try command.run()
        
        // THEN
        try compare(package: "petstore-only-schemas")
    }
    
    func testPetsStoreChangeEntityname() throws {
        // GIVEN
        let command = try Generate.parse([
            pathForSpec(named: "petstore", ext: "yaml"),
            "--output", temp.url.path,
            "--package", "petstore-change-entityname",
            "--entityname-template", "%0Generated"
        ])
        
        // WHEN
        try command.run()
        
        // THEN
        try compare(package: "petstore-change-entityname")
    }
    
    func testPestoreSingleThreaded() throws {
        // GIVEN
        let command = try Generate.parse([
            pathForSpec(named: "petstore", ext: "yaml"),
            "--output", temp.url.path,
            "--package", "petstore-single-threaded",
            "--single-threaded"
        ])
        
        // WHEN
        try command.run()
        
        // THEN
        try compare(package: "petstore-single-threaded")
    }
    
    func testPetstoreDisablePackages() throws {
        // GIVEN
        let command = try Generate.parse([
            pathForSpec(named: "petstore", ext: "yaml"),
            "--output", temp.url.path.appending("/petstore-no-package"),
            "--module", "Petstore"
        ])
        
        // WHEN
        try command.run()
        
        // THEN
        try compare(package: "petstore-no-package")
    }
    
    func testPetstoreMergeSources() throws {
        // GIVEN
        let command = try Generate.parse([
            pathForSpec(named: "petstore", ext: "yaml"),
            "--output", temp.url.path,
            "--package", "petstore-merge-sources",
            "--merge-sources"
        ])
        
        // WHEN
        try command.run()
        
        // THEN
        try compare(package: "petstore-merge-sources")
    }
    
    func testPestoreAddCustomImport() throws {
        // GIVEN
        let command = try Generate.parse([
            pathForSpec(named: "petstore", ext: "yaml"),
            "--output", temp.url.path,
            "--package", "petstore-custom-imports",
            "--config", config("""
            {
                "paths": {
                    "imports": ["Get", "HTTPHeaders", "CoreData"]
                },
                "entities": {
                    "imports": ["CoreLocation"]
                }
            }
            """)
        ])

        // WHEN
        try command.run()
        
        // THEN
        try compare(package: "petstore-custom-imports")
    }
        
    func testPestoreGenerateClasses() throws {
        // GIVEN
        let command = try Generate.parse([
            pathForSpec(named: "petstore", ext: "yaml"),
            "--output", temp.url.path,
            "--package", "petstore-generate-classes",
            "--config", config("""
            {
                "entities": {
                    "generateStructs": false
                }
            }
            """)
        ])
        
        // WHEN
        try command.run()
        
        // THEN
        try compare(package: "petstore-generate-classes")
    }
    
    func testPestoreSomeEntitiesAsClasses() throws {
        // GIVEN
        let command = try Generate.parse([
            pathForSpec(named: "petstore", ext: "yaml"),
            "--output", temp.url.path,
            "--package", "petstore-some-entities-as-classes",
            "--config", config("""
            {
                "entities": {
                    "entitiesGeneratedAsClasses": ["Store"]
                }
            }
            """)
        ])
        
        // WHEN
        try command.run()
        
        // THEN
        try compare(package: "petstore-some-entities-as-classes")
    }
    
    func testPetstoreOverrideGenerateAsStructs() throws {
        // GIVEN
        let command = try Generate.parse([
            pathForSpec(named: "petstore", ext: "yaml"),
            "--output", temp.url.path,
            "--package", "petstore-some-entities-as-structs",
            "--config", config("""
            {
                "entities": {
                    "generateStructs": false,
                    "entitiesGeneratedAsStructs": ["Error"]
                }
            }
            """)
        ])
        
        // WHEN
        try command.run()
        
        // THEN
        try compare(package: "petstore-some-entities-as-structs")
    }
    
    func testPetstoreBaseClass() throws {
        // GIVEN
        let command = try Generate.parse([
            pathForSpec(named: "petstore", ext: "yaml"),
            "--output", temp.url.path,
            "--package", "petstore-base-class",
            "--config", config("""
            {
                "entities": {
                    "generateStructs": false,
                    "baseClass": "NSObject"
                }
            }
            """)
        ])
        
        // WHEN
        try command.run()
        
        // THEN
        try compare(package: "petstore-base-class")
    }
    
    func testPetstoreDisableCommentsGeneration() throws {
        // GIVEN
        let command = try Generate.parse([
            pathForSpec(named: "petstore", ext: "yaml"),
            "--output", temp.url.path,
            "--package", "petstore-disable-comments",
            "--config", config("""
            {
                "commentOptions": false
            }
            """)
        ])
        
        // WHEN
        try command.run()
        
        // THEN
        try compare(package: "petstore-disable-comments")
    }
    
    func testPetstoreDisableInitWithCoder() throws {
        // GIVEN
        let command = try Generate.parse([
            pathForSpec(named: "petstore", ext: "yaml"),
            "--output", temp.url.path,
            "--package", "petstore-disable-init-with-coder",
            "--config", config("""
            {
                "entities": {
                    "alwaysIncludeDecodableImplementation": false
                }
            }
            """)
        ])
        
        // WHEN
        try command.run()
        
        // THEN
        try compare(package: "petstore-disable-init-with-coder")
    }
    
    func testPetstoreDisableInlining() throws {
        // GIVEN
        let command = try Generate.parse([
            pathForSpec(named: "petstore", ext: "yaml"),
            "--output", temp.url.path,
            "--package", "petstore-disable-inlining",
            "--config", config("""
            {
                "inlineTypealiases": false
            }
            """)
        ])
                
        // WHEN
        try command.run()
        
        // THEN
        try compare(package: "petstore-disable-inlining")
    }
    
    func testPetstoreDisableMutableProperties() throws {
        // GIVEN
        let command = try Generate.parse([
            pathForSpec(named: "petstore", ext: "yaml"),
            "--generate", "entities",
            "--output", temp.url.path,
            "--package", "petstore-disable-mutable-properties",
            "--config", config("""
            {
                "entities": {
                    "entitiesGeneratedAsClasses": ["Store"],
                    "mutableProperties": false
                }
            }
            """)
        ])
        
        // WHEN
        try command.run()
        
        // THEN
        try compare(package: "petstore-disable-mutable-properties")
    }
    
    func testPetstoreEnableMutableProperties() throws {
        // GIVEN
        let command = try Generate.parse([
            pathForSpec(named: "petstore", ext: "yaml"),
            "--generate", "entities",
            "--output", temp.url.path,
            "--package", "petstore-enable-mutable-properties",
            "--config", config("""
            {
                "entities": {
                    "entitiesGeneratedAsClasses": ["Store"],
                    "mutableProperties": ["classes", "structs"],
                }
            }
            """)
        ])
        
        // WHEN
        try command.run()
        
        // THEN
        try compare(package: "petstore-enable-mutable-properties")
    }

    func testPetstoreChangeNamespaceWhenRestStyle() throws {
        // GIVEN
        let command = try Generate.parse([
            pathForSpec(named: "petstore", ext: "yaml"),
            "--output", temp.url.path,
            "--package", "petstore-change-namespace-when-rest-style",
            "--config", config("""
            {
                "paths": {
                    "style": "rest",
                    "namespace": "Namespace",
                }
            }
            """)
        ])

        // WHEN
        try command.run()

        // THEN
        try compare(package: "petstore-change-namespace-when-rest-style")
    }

    func testPetstoreChangeNamespaceWhenOperationsStyle() throws {
        // GIVEN
        let command = try Generate.parse([
            pathForSpec(named: "petstore", ext: "yaml"),
            "--output", temp.url.path,
            "--package", "petstore-change-namespace-when-operations-style",
            "--config", config("""
            {
                "paths": {
                    "style": "operations",
                    "namespace": "Namespace",
                }
            }
            """)
        ])

        // WHEN
        try command.run()

        // THEN
        try compare(package: "petstore-change-namespace-when-operations-style")
    }
        
    func testEdgecasesRenamePrperties() throws {
        // GIVEN
        let command = try Generate.parse([
            pathForSpec(named: "edgecases", ext: "yaml"),
            "--output", temp.url.path,
            "--package", "edgecases-rename-properties",
            "--config", config("""
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
            """)
        ])
                
        // WHEN
        try command.run()
        
        // THEN
        //
        // 1) "Category.name": "title",
        // Only Categy.name should be affected, but not anything else, e.g. Tag.name
        //
        // 2) "Pet.status": "state"
        // Check that enum name also changes
        //
        // 3) "complete": "isDone"
        // // Applied before boolean logic
        
        try compare(package: "edgecases-rename-properties")
    }
    
    
    func testEdgecasesPassYAMLConfiguration() throws {
        // GIVEN
        let command = try Generate.parse([
            pathForSpec(named: "edgecases", ext: "yaml"),
            "--output", temp.url.path,
            "--package", "edgecases-yaml-config",
            "--config", config("""
            rename:
                properties:
                    id: identifier
                    Category.name: title
                    Pet.status: state
                    complete: isDone
            """, ext: "yaml")
            ])
            
        // WHEN
        try command.run()
        
        // THEN
        try compare(package: "edgecases-yaml-config")
    }
    
    func testEdgecasesChangeAccessControl() throws {
        // GIVEN
        let command = try Generate.parse([
            pathForSpec(named: "edgecases", ext: "yaml"),
            "--output", temp.url.path,
            "--package", "edgecases-change-access-control",
            "--config", config("""
            {
                "access": ""
            }
            """)
        ])
                
        // WHEN
        try command.run()
        
        // THEN
        try compare(package: "edgecases-change-access-control")
    }
                    
    func testEdgecasesDisableAcronyms() throws {
        // GIVEN
        let command = try Generate.parse([
            pathForSpec(named: "edgecases", ext: "yaml"),
            "--output", temp.url.path,
            "--package", "edgecases-disable-acronyms",
            "--config", config("""
            {
                "acronyms": []
            }
            """)
        ])
                
        // WHEN
        try command.run()
        
        // THEN
        try compare(package: "edgecases-disable-acronyms")
    }
    
    func testEdgecasesDisableEnumGeneration() throws {
        // GIVEN
        let command = try Generate.parse([
            pathForSpec(named: "edgecases", ext: "yaml"),
            "--output", temp.url.path,
            "--package", "edgecases-disable-enums",
            "--config", config("""
            {
                "generateEnums": false
            }
            """)
        ])
                
        // WHEN
        try command.run()
        
        // THEN
        try compare(package: "edgecases-disable-enums")
    }
    
    func testEdgecasesRename() throws {
        // GIVEN
        let command = try Generate.parse([
            pathForSpec(named: "edgecases", ext: "yaml"),
            "--output", temp.url.path,
            "--package", "edgecases-rename",
            "--config", config("""
            {
                "rename": {
                    "properties": {
                        "ContainerA.Child.Child.renameMe": "onlyItRenamed"
                    },
                    "entities": {
                        "ApiResponse": "APIResponse",
                        "Status": "State"
                    }
                }
            }
            """)
        ])
                
        // WHEN
        try command.run()
        
        // THEN
        // "Status" is not affected because it's an enum
        try compare(package: "edgecases-rename")
    }
    
    func testEdgecasesIndentWithTabs() throws {
        // GIVEN
        let command = try Generate.parse([
            pathForSpec(named: "edgecases", ext: "yaml"),
            "--output", temp.url.path,
            "--package", "edgecases-tabs",
            "--config", config("""
            {
                "indentation": "tabs"
            }
            """)
        ])
                
        // WHEN
        try command.run()
        
        // THEN
        try compare(package: "edgecases-tabs")
    }
    
    func testEdgecasesIndentWithTwoWidthSpaces() throws {
        // GIVEN
        let command = try Generate.parse([
            pathForSpec(named: "edgecases", ext: "yaml"),
            "--output", temp.url.path,
            "--package", "edgecases-indent-with-two-width-spaces",
            "--config", config("""
            {
                "spaceWidth": 2
            }
            """)
        ])
                
        // WHEN
        try command.run()
        
        // THEN
        try compare(package: "edgecases-indent-with-two-width-spaces")
    }
    
    func testEdgecasesEnableIntegerCapacity() throws {
        // GIVEN
        let command = try Generate.parse([
            pathForSpec(named: "edgecases", ext: "yaml"),
            "--output", temp.url.path,
            "--package", "edgecases-int32-int64",
            "--config", config("""
            {
                "useFixWidthIntegers": true
            }
            """)
        ])
                
        // WHEN
        try command.run()
        
        // THEN
        try compare(package: "edgecases-int32-int64")
    }
    
    func testEdgecasesGenerateCodingKeys() throws {
        // GIVEN
        let command = try Generate.parse([
            pathForSpec(named: "edgecases", ext: "yaml"),
            "--output", temp.url.path,
            "--package", "edgecases-coding-keys",
            "--config", config("""
            entities:
                optimizeCodingKeys: true
            """, ext: "yaml")
        ])
                
        // WHEN
        try command.run()
        
        // THEN
        try compare(package: "edgecases-coding-keys")
    }

    func testStripNamePrefixNestedObjectsEnabled() throws {
        // GIVEN
        let command = try Generate.parse([
            pathForSpec(named: "strip-parent-name-nested-objects", ext: "yaml"),
            "--output", temp.url.path,
            "--package", "strip-parent-name-nested-objects-enabled",
            "--config", config("""
            entities:
                stripParentNameInNestedObjects: true
            """, ext: "yaml")
        ])
                
        // WHEN
        try command.run()
        
        // THEN
        try compare(package: "strip-parent-name-nested-objects-enabled")
    }  

    func testStripNamePrefixNestedObjects() throws {
        // GIVEN
        let command = try Generate.parse([
            pathForSpec(named: "strip-parent-name-nested-objects", ext: "yaml"),
            "--output", temp.url.path,
            "--package", "strip-parent-name-nested-objects-default"
        ])
                
        // WHEN
        try command.run()
        
        // THEN
        try compare(package: "strip-parent-name-nested-objects-default")
    }
    
    func testPetstoreIdentifiableEnabled() throws {
        // GIVEN
        let command = try Generate.parse([
            pathForSpec(named: "petstore", ext: "yaml"),
            "--output", temp.url.path,
            "--package", "petstore-identifiable",
            "--generate", "entities",
            "--config", config("""
            entities:
                includeIdentifiableConformance: true
            rename:
                properties:
                    Error.code: id
            """, ext: "yaml")
        ])
        
        // WHEN
        try command.run()
        
        // THEN
        try compare(package: "petstore-identifiable")
    }
    
    func testPetstoreFilenameTemplate() throws {
        // GIVEN
        let command = try Generate.parse([
            pathForSpec(named: "petstore", ext: "yaml"),
            "--output", temp.url.path,
            "--package", "petstore-filename-template",
            "--config", config("""
            entities:
                filenameTemplate: "%0Model.swift"
            paths:
                filenameTemplate: "%0API.swift"
            """, ext: "yaml")
        ])
        
        // WHEN
        try command.run()
        
        // THEN
        try compare(package: "petstore-filename-template")
    }
}
