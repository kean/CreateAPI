import CreateOptions
import Foundation
import XCTest

final class GenerateOptionsTests: XCTestCase {
    func testWarningDetection() throws {
        // Given a configuration containing unexpected properties
        let data = Data("""
        access: public
        isATopLevelInvalidOption: true
        entities:
          isANestedInvalidOption: true
        paths:
          overridenResponses:
            Foo: Bar
        """.utf8)

        // When the options are loaded
        let options = try GenerateOptions(data: data)

        // Then the appropriate warnings should be recorded
        XCTAssertEqual(options.warnings, [
            "Found an unexpected property 'isANestedInvalidOption' (in 'entities').",
            "The property 'overridenResponses' (in 'paths') has been deprecated. Renamed to 'overriddenResponses'.",
            "Found an unexpected property 'isATopLevelInvalidOption'."
        ])
    }

    func testOverriddenResponsesContainsLegacyProperty() throws {
        let options = try GenerateOptions(data: Data("""
        paths:
          overridenResponses:
            A: Z
            B: Y
          overriddenResponses:
            A: 0
            C: 2
        """.utf8))

        XCTAssertEqual(options.paths.overriddenResponses, [
            "A": "0", // Overridden from new property
            "B": "Y", // Merged from legacy property
            "C": "2"  // From new property
        ])
    }

    func testOverriddenBodyTypesContainsLegacyProperty() throws {
        let options = try GenerateOptions(data: Data("""
        paths:
          overridenBodyTypes:
            A: Z
            B: Y
          overriddenBodyTypes:
            A: 0
            C: 2
        """.utf8))

        XCTAssertEqual(options.paths.overriddenBodyTypes, [
            "A": "0", // Overridden from new property
            "B": "Y", // Merged from legacy property
            "C": "2"  // From new property
        ])
    }
}
