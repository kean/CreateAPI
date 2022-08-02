import XCTest
import OpenAPIKit30
@testable import create_api

final class GenerateFeaturesTests: GenerateBaseTests {    
    func testQueryParameters() throws {
        try testSpec(name: "test-query-parameters", ext: "yaml")
    }
}
