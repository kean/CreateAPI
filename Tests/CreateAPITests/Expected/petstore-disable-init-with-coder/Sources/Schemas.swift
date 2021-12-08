// Generated by Create API
// https://github.com/kean/CreateAPI
//
// swiftlint:disable all

import Foundation

/// A pet title
///
/// A pet description
public struct Pet: Decodable {
    public var id: Int
    /// Example: Buddy
    public var name: String
    public var tag: String?
}

public struct Store: Decodable {
    public var pets: [Pet]
}

public struct Error: Decodable {
    public var code: Int
    public var message: String
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