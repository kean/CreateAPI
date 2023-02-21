// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation

public struct AnotherContainer: Codable {
    public var content: Content

    public enum Content: Codable {
        case a(A)
        case three(Three)
        case string(String)

        public init(from decoder: Decoder) throws {

            struct Discriminator: Decodable {
                let kind: String
            }

            let container = try decoder.singleValueContainer()
            let discriminatorValue = try container.decode(Discriminator.self).kind

            switch discriminatorValue {
            case "one": self = .a(try container.decode(A.self))
            case "two": self = .a(try container.decode(A.self))
            case "three": self = .three(try container.decode(Three.self))
            case "four": self = .string(try container.decode(String.self))

            default:
                throw DecodingError.dataCorruptedError(
                    in: container,
                    debugDescription: "Discriminator value '\(discriminatorValue)' does not match any expected values (one, two, three, four)."
                )
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.singleValueContainer()
            switch self {
            case .a(let value): try container.encode(value)
            case .three(let value): try container.encode(value)
            case .string(let value): try container.encode(value)
            }
        }
    }

    public init(content: Content) {
        self.content = content
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.content = try values.decode(Content.self, forKey: "content")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(content, forKey: "content")
    }
}
