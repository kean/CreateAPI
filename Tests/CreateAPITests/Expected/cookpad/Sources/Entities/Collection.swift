// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation

public struct Collection: Codable {
    /// The unique collection identifier.
    public var id: Int
    /// The title of the collection.
    ///
    /// Example: "BBQ Classics"
    public var title: String
    /// A longer description of the collection.
    /// This is also a comment, but on a new line using the \n line break.
    ///
    /// Example: "The sun is shining? The BBQ is out? Check out this collection of recipes for the perfect summer BBQ."
    public var description: String
    /// The number of recipes in this collection.
    /// This is also a comment, but on a new line using the \r line break.
    ///
    /// Example: 27
    public var recipeCount: Int
    /// URLs to images for up to a maximum of four recipes in the collection.
    ///
    /// Example: ["https://img-global.cpcdn.com/recipes/65555efe64df98ce/m/photo.jpg"]
    public var previewImageURLs: [URL]

    public init(id: Int, title: String, description: String, recipeCount: Int, previewImageURLs: [URL]) {
        self.id = id
        self.title = title
        self.description = description
        self.recipeCount = recipeCount
        self.previewImageURLs = previewImageURLs
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.id = try values.decode(Int.self, forKey: "id")
        self.title = try values.decode(String.self, forKey: "title")
        self.description = try values.decode(String.self, forKey: "description")
        self.recipeCount = try values.decode(Int.self, forKey: "recipe_count")
        self.previewImageURLs = try values.decode([URL].self, forKey: "preview_image_urls")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(id, forKey: "id")
        try values.encode(title, forKey: "title")
        try values.encode(description, forKey: "description")
        try values.encode(recipeCount, forKey: "recipe_count")
        try values.encode(previewImageURLs, forKey: "preview_image_urls")
    }
}
