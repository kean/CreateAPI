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
}
