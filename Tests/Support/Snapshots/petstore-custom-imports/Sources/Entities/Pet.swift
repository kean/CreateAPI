// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import CoreLocation

/// A pet title
///
/// A pet description
public struct Pet: Codable {
    public var id: Int64
    /// Example: "Buddy"
    public var name: String
    public var tag: String?

    public init(id: Int64, name: String, tag: String? = nil) {
        self.id = id
        self.name = name
        self.tag = tag
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.id = try values.decode(Int64.self, forKey: "id")
        self.name = try values.decode(String.self, forKey: "name")
        self.tag = try values.decodeIfPresent(String.self, forKey: "tag")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(id, forKey: "id")
        try values.encode(name, forKey: "name")
        try values.encodeIfPresent(tag, forKey: "tag")
    }
}
