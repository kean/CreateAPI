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
        """.utf8)

        // When the options are loaded
        let options = try GenerateOptions(data: data)

        // Then the appropriate warnings should be recorded
        XCTAssertEqual(options.warnings, [
            "Found an unexpected property 'entities.isANestedInvalidOption'.",
            "Found an unexpected property 'isATopLevelInvalidOption'."
        ])
    }
}
