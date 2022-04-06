// Generated by Create API
// https://github.com/CreateAPI/CreateAPI
//
// swiftlint:disable all

import Foundation

public struct Collection: Codable {
    /// The unique collection identifier.
    public var id: Int
    /// The title of the collection.
    ///
    /// Example: "BBQ Classics"
    public var title: String
    /// A longer description of the collection.
    ///
    /// Example: "The sun is shining? The BBQ is out? Check out this collection of recipes for the perfect summer BBQ."
    public var description: String
    /// The number of recipes in this collection.
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

    private enum CodingKeys: String, CodingKey {
        case id
        case title
        case description
        case recipeCount = "recipe_count"
        case previewImageURLs = "preview_image_urls"
    }
}

public struct Recipe: Codable {
    /// The unique recipe identifier.
    ///
    /// Example: 2380570
    public var id: Int
    /// The title of the recipe.
    ///
    /// Example: "BBQ Sticky Ribs"
    public var title: String
    /// The story behind the recipe.
    ///
    /// Example: "Pork ribs marinated overnight in a sweet barbecue sauce slowly cooked and finished off on a BBQ"
    public var story: String
    /// A URL to the main image of the recipe, or null if one was not specified.
    ///
    /// Example: "https://img-global.cpcdn.com/recipes/65555efe64df98ce/m/photo.jpg"
    public var imageURL: URL?
    /// The date that the recipe was published in ISO8601 format.
    ///
    /// Example: "2017-07-05T02:34:00+00:00"
    public var publishedAt: Date
    public var user: User
    /// An array of ingredients used within the recipe.
    ///
    /// Example: ["2 kg pork ribs", "400 g chopped tomatoes", "5 garlic cloves", "100 g soft brown sugar", "75 ml maple syrup", "150 ml ketchup", "150 ml BBQ sauce", "150 ml Honey Jack Daniels whiskey", "50 ml cider vinegar", "2 tbsp black treacle", "3 tbsp soy sauce", "2 tbsp Worcestershire sauce"]
    public var ingredients: [String]
    /// An array of steps to follow within the recipe.
    public var steps: [Step]

    public init(id: Int, title: String, story: String, imageURL: URL? = nil, publishedAt: Date, user: User, ingredients: [String], steps: [Step]) {
        self.id = id
        self.title = title
        self.story = story
        self.imageURL = imageURL
        self.publishedAt = publishedAt
        self.user = user
        self.ingredients = ingredients
        self.steps = steps
    }

    private enum CodingKeys: String, CodingKey {
        case id
        case title
        case story
        case imageURL = "image_url"
        case publishedAt = "published_at"
        case user
        case ingredients
        case steps
    }
}

public struct User: Codable {
    /// The name of the user.
    ///
    /// Example: "Liam Nichols"
    public var name: String
    /// A URL to the user profile image, or null if one was not specified.
    ///
    /// Example: "https://img-global.cpcdn.com/users/f34ef79fabdb58a4/m/photo.jpg"
    public var imageURL: URL?

    public init(name: String, imageURL: URL? = nil) {
        self.name = name
        self.imageURL = imageURL
    }

    private enum CodingKeys: String, CodingKey {
        case name
        case imageURL = "image_url"
    }
}

public struct Step: Codable {
    /// The instructions for the step.
    ///
    /// Example: "Crush the garlic cloves and add all ingredients apart from the ribs into a pan"
    public var description: String
    /// An array of up to three image URLs associated with the step.
    ///
    /// Example: ["https://img-global.cpcdn.com/steps/0606534c251df2e5/m/photo.jpg"]
    public var imageURLs: [URL]

    public init(description: String, imageURLs: [URL]) {
        self.description = description
        self.imageURLs = imageURLs
    }

    private enum CodingKeys: String, CodingKey {
        case description
        case imageURLs = "image_urls"
    }
}

struct StringCodingKey: CodingKey, ExpressibleByStringLiteral {
    private let string: String
    private var int: Int?

    var stringValue: String { return string }

    init(string: String) {
        self.string = string
    }

    init?(stringValue: String) {
        self.string = stringValue
    }

    var intValue: Int? { return int }

    init?(intValue: Int) {
        self.string = String(describing: intValue)
        self.int = intValue
    }

    init(stringLiteral value: String) {
        self.string = value
    }
}
