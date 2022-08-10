import Foundation

public struct ModuleName: RawRepresentable {
    public let rawValue: String

    public init(rawValue: String) {
        self.rawValue = rawValue
    }

    public var name: String {
        rawValue.replacingOccurrences(of: "-", with: "_")
    }
}

extension ModuleName: CustomStringConvertible {
    public var description: String {
        rawValue
    }
}

extension ModuleName: ExpressibleByStringLiteral {
    public init(stringLiteral value: StringLiteralType) {
        self.init(rawValue: value)
    }
}

extension ModuleName: Decodable {
}
