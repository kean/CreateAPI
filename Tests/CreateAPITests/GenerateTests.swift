import XCTest
@testable import create_api

final class GenerateTests: GenerateBaseTests {
    func testPestore() throws {
        try testSpec(name: "petstore", ext: "yaml", package: "petstore-default")
    }
    
    func testEdgecases() throws {
        try testSpec(name: "edgecases", ext: "yaml", package: "edgecases-default")
    }

    func testInlining() throws {
        try testSpec(name: "inlining", ext: "yaml", package: "inlining-default", config: """
        entities:
          inlineReferencedSchemas: true
          typeOverrides:
            Letter: finalClass
        """)
    }

    func testDiscriminator() throws {
        try testSpec(name: "discriminator", ext: "yaml", package: "discriminator")
    }    
    
    func testGitHub() throws {
        // GIVEN
        let command = try Generate.parse([
            pathForSpec(named: "github", ext: "yaml"),
            "--output", temp.url.path,
            "--strict",
            "--package", "OctoKit",
            "--vendor", "github",
            "--config", config("""
            paths:
              overriddenResponses:
                accepted: "Void"
              overriddenBodyTypes:
                application/octocat-stream: String
            rename:
              enumCases:
                reactions-+1: "reactionsPlusOne"
                reactions--1: "reactionsMinusOne"
            """, ext: "yaml")
        ])
                
        // WHEN
        try command.run()
        
        // THEN
        try compare(package: "OctoKit")
    }

    func testCookpad() throws {
        try testSpec(name: "cookpad", ext: "json")
    }
}
