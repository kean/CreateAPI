// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import NaiveDate

public struct Pet: Codable {
    public var identifier: Int?
    public var category: Category?
    /// Example: "doggie"
    public var name: String
    public var photoURLs: [String]
    public var tags: [Tag]?
    /// Pet status in the store
    public var state: Status?

    /// Pet status in the store
    public enum Status: String, Codable, CaseIterable {
        case available
        case pending
        case sold
    }

    public init(identifier: Int? = nil, category: Category? = nil, name: String, photoURLs: [String], tags: [Tag]? = nil, state: Status? = nil) {
        self.identifier = identifier
        self.category = category
        self.name = name
        self.photoURLs = photoURLs
        self.tags = tags
        self.state = state
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.identifier = try values.decodeIfPresent(Int.self, forKey: "id")
        self.category = try values.decodeIfPresent(Category.self, forKey: "category")
        self.name = try values.decode(String.self, forKey: "name")
        self.photoURLs = try values.decode([String].self, forKey: "photoUrls")
        self.tags = try values.decodeIfPresent([Tag].self, forKey: "tags")
        self.state = try values.decodeIfPresent(Status.self, forKey: "status")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(identifier, forKey: "id")
        try values.encodeIfPresent(category, forKey: "category")
        try values.encode(name, forKey: "name")
        try values.encode(photoURLs, forKey: "photoUrls")
        try values.encodeIfPresent(tags, forKey: "tags")
        try values.encodeIfPresent(state, forKey: "status")
    }
}
