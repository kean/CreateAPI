import XCTest
@testable import create_api

final class GenerateFeaturesTests: GenerateTestCase {    
    func testQueryParameters() throws {
        try snapshot(
            spec: .testQueryParameters,
            name: "test-query-parameters",
            arguments: [
                "--package", "test-query-parameters"
            ]
        )
    }
}
