@testable import create_api
import XCTest

final class GenerateArgumentTests: GenerateTestCase {
    func testConfig_defaultFileDoesNotExist() throws {
        // Given no default configuration file exists in the default location
        try? FileManager.default.removeItem(at: temp.url.appending(path: ".create-api.yml"))

        // When `--config` is not specified in the options
        let arguments: [String] = [
            "--package", "Package",
            "--output", temp.url.path,
            SpecFixture.edgecases.path
        ]

        // Then the generator will not throw an error if the file doesn't exist
        XCTAssertNoThrow(try generate(arguments))
    }

    func testConfig_userDefinedDefaultLocationDoesNotExist() throws {
        // Given no default configuration file exists in the default location
        try? FileManager.default.removeItem(at: temp.url.appending(path: ".create-api.yml"))

        // When `--config` is not specified as the same location that is the default
        let arguments: [String] = [
            "--config", ".create-api.yaml",
            "--package", "Package",
            "--output", temp.url.path,
            SpecFixture.edgecases.path
        ]

        // Then the generator will throw an error because the specified file does not exist
        XCTAssertThrowsError(try generate(arguments)) { error in
            // Error contains absolute path which is not stable when testing
            XCTAssertTrue(error.localizedDescription.hasSuffix(".create-api.yaml does not exist."))
        }
    }

    func testConfig_userDefinedCustomLocationDoesNotExist() throws {
        // Given no default configuration file exists in the user-defined location
        try? FileManager.default.removeItem(at: temp.url.appending(path: "options.json"))

        // When `--config` is defined as a custom location
        let arguments: [String] = [
            "--config", "options.json",
            "--package", "Package",
            "--output", temp.url.path,
            SpecFixture.edgecases.path
        ]

        // Then the generator will throw an error because the specified file does not exist
        XCTAssertThrowsError(try generate(arguments)) { error in
            // Error contains absolute path which is not stable when testing
            XCTAssertTrue(error.localizedDescription.hasSuffix("options.json does not exist."))
        }
    }
}
