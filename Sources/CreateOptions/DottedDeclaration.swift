import Foundation
    
/// Used to represent `first` or `first.second` dotted notation in config options where available.
///
/// **Examples**
/// ```yaml
/// exclude:
///   - Pet
///   - Error.code
/// dataTypeOverrides:
///   string.uuid: String
/// ```
///
public struct DottedDeclaration: RawRepresentable, Codable, Hashable {
    public var first: String
    public var second: String?

    public init(first: String, second: String?) {
        self.first = first
        self.second = second
    }

    public init?(rawValue: String) {
        let components = rawValue.components(separatedBy: ".")
        switch components.count {
        case 1:
            self.init(first: components[0], second: nil)
        case 2:
            self.init(first: components[0], second: components[1])
        default:
            return nil
        }
    }

    public var rawValue: String {
        if let second = second {
            return "\(first).\(second)"
        } else {
            return first
        }
    }
}
