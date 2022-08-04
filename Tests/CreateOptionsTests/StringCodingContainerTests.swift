@testable import CreateOptions
import XCTest

final class StringCodingContainerTests: XCTestCase {
    struct Subject: Decodable {
        enum KnownKeys: String {
            case newProperty, deprecatedProperty
        }

        // let legacyProperty: [String]
        let newProperty: String
        let deprecatedProperty: String

        init(from decoder: Decoder) throws {
            let container = try StringCodingContainer<KnownKeys>(decoder: decoder)

            newProperty = try container.decode(String.self, forKey: .newProperty, defaultValue: "default")
            deprecatedProperty = try container.decode(String.self, forKey: .deprecatedProperty, defaultValue: "")

            container.recordPotentialIssues(
                deprecations: [
                    ("deprecatedProperty", "Renamed to 'newProperty'.")
                ],
                replacements: [
                    ("legacyProperty", "Use 'newProperty' instead.")
                ]
            )
        }
    }

    func testIssueRecording() throws {
        let recorder = IssueRecorder()
        let decoder = JSONDecoder()
        decoder.userInfo = [
            .issueRecorder: recorder
        ]

        // Given JSON with legacy properties, unknown properties and deprecated properties defined
        let data = Data("""
        {
          "legacyProperty": ["foo"],
          "deprecatedProperty": "bar",
          "unknownProperty": 1
        }
        """.utf8)

        // When decoded
        let subject = try decoder.decode(Subject.self, from: data)

        // Then the subject is decoded as expected
        XCTAssertEqual(subject.newProperty, "default")
        XCTAssertEqual(subject.deprecatedProperty, "bar") // parsed from the json

        // And the appropriate issues were recorded
        XCTAssertEqual(Set(recorder.issues.map(\.description)), [
            "The property 'legacyProperty' is no longer supported. Use 'newProperty' instead.",
            "Found an unexpected property 'unknownProperty'.",
            "The property 'deprecatedProperty' has been deprecated. Renamed to 'newProperty'."
        ])
    }
}
