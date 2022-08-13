import XCTest
@testable import create_api

final class GenerateTests: GenerateTestCase {
    func testPestore() throws {
        try snapshot(
            spec: .petstore,
            name: "petstore-default"
        )
    }
    
    func testEdgecases() throws {
        try snapshot(
            spec: .edgecases,
            name: "edgecases-default"
        )
    }

    func testInlining() throws {
        try snapshot(
            spec: .inlining,
            name: "inlining-default",
            configuration: """
            entities:
              inlineReferencedSchemas: true
              typeOverrides:
                Letter: finalClass
            """
        )
    }

    func testDiscriminator() throws {
        try snapshot(
            spec: .discriminator,
            name: "discriminator"
        )
    }    
    
    func testGitHub() throws {
        try snapshot(
            spec: .github,
            name: "OctoKit",
            arguments: [
                "--strict"
            ],
            configuration: """
            vendor: github
            paths:
              overriddenResponses:
                accepted: "Void"
              overriddenBodyTypes:
                application/octocat-stream: String
            entities:
              inlineReferencedSchemas: false
            rename:
              enumCases:
                reactions-+1: "reactionsPlusOne"
                reactions--1: "reactionsMinusOne"
            """
        )
    }

    func testCookpad() throws {
        try snapshot(
            spec: .cookpad,
            name: "cookpad"
        )
    }
}
