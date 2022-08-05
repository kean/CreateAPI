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

    // MARK: - Decoder Overloads

    struct StringCollections: Decodable {
        enum KnownKeys: String {
            case array, set
        }

        let array: [String]
        let set: Set<String>

        init(from decoder: Decoder) throws {
            let container = try StringCodingContainer<KnownKeys>(decoder: decoder)
            self.array = try container.decode([String].self, forKey: .array, defaultValue: [])
            self.set = try container.decode(Set<String>.self, forKey: .set, defaultValue: [])
        }
    }

    struct OptionCollections: Decodable {
        enum Option: String, CaseIterable, Decodable {
            case one, two, three
        }

        enum KnownKeys: String {
            case array, set
        }

        let array: [Option]
        let set: Set<Option>

        init(from decoder: Decoder) throws {
            let container = try StringCodingContainer<KnownKeys>(decoder: decoder)
            self.array = try container.decode([Option].self, forKey: .array, defaultValue: [])
            self.set = try container.decode(Set<Option>.self, forKey: .set, defaultValue: [])
        }
    }

    func testDecodeStringCollection() throws {
        let decoded = try decode(as: StringCollections.self, from: """
            {
              "array": [
                "foo"
              ],
              "set": [
                "bar"
              ]
            }
            """)

        XCTAssertEqual(decoded.array, ["foo"])
        XCTAssertEqual(decoded.set, ["bar"])
    }

    func testDecodeSingleStringIntoCollections() throws {
        let decoded = try decode(as: StringCollections.self, from: """
            {
              "array": "foo",
              "set": "bar"
            }
            """)

        XCTAssertEqual(decoded.array, ["foo"])
        XCTAssertEqual(decoded.set, ["bar"])
    }

    func testDecodeOptionCollection() throws {
        let decoded = try decode(as: OptionCollections.self, from: """
            {
              "array": [
                "one"
              ],
              "set": [
                "two"
              ]
            }
            """)

        XCTAssertEqual(decoded.array, [.one])
        XCTAssertEqual(decoded.set, [.two])
    }

    func testDecodeOptionCollectionFromTrue() throws {
        let decoded = try decode(as: OptionCollections.self, from: """
            {
              "array": true,
              "set": true
            }
            """)

        XCTAssertEqual(decoded.array, [.one, .two, .three])
        XCTAssertEqual(decoded.set, [.one, .two, .three])
    }

    func testDecodeOptionCollectionFromFalse() throws {
        let decoded = try decode(as: OptionCollections.self, from: """
            {
              "array": false,
              "set": false
            }
            """)

        XCTAssertEqual(decoded.array, [])
        XCTAssertEqual(decoded.set, [])
    }

    func testDecodeOptionCollectionFromSingleValue() throws {
        let decoded = try decode(as: OptionCollections.self, from: """
            {
              "array": "two",
              "set": "three"
            }
            """)

        XCTAssertEqual(decoded.array, [.two])
        XCTAssertEqual(decoded.set, [.three])
    }

    private func decode<T: Decodable>(as: T.Type, from contents: String) throws -> T {
        let data = Data(contents.utf8)
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    }
}
