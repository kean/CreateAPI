// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation

public final class Store: Codable {
    public var pets: [Pet]

    public init(pets: [Pet]) {
        self.pets = pets
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.pets = try values.decode([Pet].self, forKey: "pets")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(pets, forKey: "pets")
    }
}
