import XCTest
@testable import create_api

final class GenerateTests: GenerateBaseTests {
    func testPestore() throws {
        try snapshot(
            spec: .petstore,
            name: "petstore-default",
            arguments: [
                "--package", "petstore-default"
            ]
        )
    }
    
    func testEdgecases() throws {
        try snapshot(
            spec: .edgecases,
            name: "edgecases-default",
            arguments: [
                "--package", "edgecases-default"
            ]
        )
    }

    func testInlining() throws {
        try snapshot(
            spec: .inlining,
            name: "inlining-default",
            arguments: [
                "--package", "inlining-default"
            ],
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
            name: "discriminator",
            arguments: [
                "--package", "discriminator"
            ]
        )
    }    
    
    func testGitHub() throws {
        try snapshot(
            spec: .github,
            name: "OctoKit",
            arguments: [
                "--strict",
                "--package", "OctoKit",
                "--vendor", "github"
            ],
            configuration: """
            paths:
              overriddenResponses:
                accepted: "Void"
              overriddenBodyTypes:
                application/octocat-stream: String
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
            name: "cookpad",
            arguments: [
                "--package", "cookpad"
            ]
        )
    }
}
