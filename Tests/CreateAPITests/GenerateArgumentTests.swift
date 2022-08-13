@testable import create_api
import XCTest

final class GenerateArgumentTests: GenerateTestCase {
    func testConfig_defaultFileDoesNotExist() throws {
        // Given no default configuration file exists in the default location
        try? FileManager.default.removeItem(at: temp.url.appending(path: ".create-api.yml"))

        // When `--config` is not specified in the options
        let arguments: [String] = [
            "--config-option", "module=Package",
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
            "--config-option", "module=Package",
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
            "--config-option", "module=Package",
            "--output", temp.url.path,
            SpecFixture.edgecases.path
        ]

        // Then the generator will throw an error because the specified file does not exist
        XCTAssertThrowsError(try generate(arguments)) { error in
            // Error contains absolute path which is not stable when testing
            XCTAssertTrue(error.localizedDescription.hasSuffix("options.json does not exist."))
        }
    }

    func testClean() throws {
        // Given old source files exist in the output directory
        let oldFileURL = temp.url.appendingPathComponent("Old.swift")
        try "".write(to: oldFileURL)

        // When the arguments result in cleaning the output
        let arguments: [String] = [
            "--clean",
            "--config-option", "module=Package",
            "--output", temp.url.path,
            SpecFixture.edgecases.path
        ]

        // Then the generator will succeed and the old source file will have been removed
        XCTAssertNoThrow(try generate(arguments))
        XCTAssertFalse(FileManager.default.fileExists(atPath: oldFileURL.path))
    }

    func testClean_notAllowedWhenConfigIsInTheOutput() throws {
        // Given `--config` file exists in the output directory
        let configURL = temp.url.appendingPathComponent(".create-api.yml")
        try "{}".write(to: configURL)

        // When the arguments result in trying to clean the config file
        let arguments: [String] = [
            "--clean",
            "--config", configURL.path,
            "--config-option", "module=Package",
            "--output", temp.url.path,
            SpecFixture.edgecases.path
        ]

        // Then the generator will throw an error to protect the config
        XCTAssertThrowsError(try generate(arguments)) { error in
            XCTAssertEqual(error.localizedDescription, "Unable to clean because your config file is in the output directory")
        }
        XCTAssertTrue(FileManager.default.fileExists(atPath: configURL.path))
    }

    func testClean_notAllowedWhenSpecIsInTheOutput() throws {
        // Given the input spec file exists in the output directory
        let specURL = temp.url.appendingPathComponent("schema.json")
        try FileManager.default.copyItem(atPath: SpecFixture.edgecases.path, toPath: specURL.path)

        // When the arguments result in trying to clean the spec file
        let arguments: [String] = [
            "--clean",
            "--config-option", "module=Package",
            "--output", temp.url.path,
            specURL.path
        ]

        // Then the generator will throw an error because the spec cannot be deleted
        XCTAssertThrowsError(try generate(arguments)) { error in
            XCTAssertEqual(error.localizedDescription, "Unable to clean because your input spec is in the output directory")
        }
        XCTAssertTrue(FileManager.default.fileExists(atPath: specURL.path))
    }
}
