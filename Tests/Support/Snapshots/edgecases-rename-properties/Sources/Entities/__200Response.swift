// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import NaiveDate

/// Model for testing model name starting with number
public struct __200Response: Codable {
    public var name: Int32?
    public var `class`: String?

    public init(name: Int32? = nil, `class`: String? = nil) {
        self.name = name
        self.class = `class`
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.name = try values.decodeIfPresent(Int32.self, forKey: "name")
        self.class = try values.decodeIfPresent(String.self, forKey: "class")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(name, forKey: "name")
        try values.encodeIfPresent(`class`, forKey: "class")
    }
}
