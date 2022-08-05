// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import NaiveDate

public struct Pet: Codable {
    public var id: Int?
    public var category: Category?
    /// Example: "doggie"
    public var name: String
    public var photoURLs: [String]
    public var tags: [Tag]?
    /// Pet status in the store
    public var status: Status?

    /// Pet status in the store
    public enum Status: String, Codable, CaseIterable {
        case available
        case pending
        case sold
    }

    public init(id: Int? = nil, category: Category? = nil, name: String, photoURLs: [String], tags: [Tag]? = nil, status: Status? = nil) {
        self.id = id
        self.category = category
        self.name = name
        self.photoURLs = photoURLs
        self.tags = tags
        self.status = status
    }

    private enum CodingKeys: String, CodingKey {
        case id
        case category
        case name
        case photoURLs = "photoUrls"
        case tags
        case status
    }
}
