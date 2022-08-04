// Generated by Create API
// https://github.com/CreateAPI/CreateAPI
//
// swiftlint:disable all

import Foundation

public struct ContainerA: Codable {
    public var a: String?

    public init(a: String? = nil) {
        self.a = a
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.a = try values.decodeIfPresent(String.self, forKey: "a")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(a, forKey: "a")
    }
}

public struct ContainerB: Codable {
    public var b: String?

    public init(b: String? = nil) {
        self.b = b
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.b = try values.decodeIfPresent(String.self, forKey: "b")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(b, forKey: "b")
    }
}

public struct ContainerC: Codable {
    public var c: String?

    public init(c: String? = nil) {
        self.c = c
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.c = try values.decodeIfPresent(String.self, forKey: "c")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(c, forKey: "c")
    }
}

public struct Container: Codable {
    public var content: Content

    public enum Content: Codable {
        case a(ContainerA)
        case b(ContainerB)
        case c(ContainerC)

        public init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            if let value = try? container.decode(ContainerA.self) {
                self = .a(value)
            } else if let value = try? container.decode(ContainerB.self) {
                self = .b(value)
            } else if let value = try? container.decode(ContainerC.self) {
                self = .c(value)
            } else {
                throw DecodingError.dataCorruptedError(in: container, debugDescription: "Failed to intialize `oneOf`")
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.singleValueContainer()
            switch self {
            case .a(let value): try container.encode(value)
            case .b(let value): try container.encode(value)
            case .c(let value): try container.encode(value)
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
