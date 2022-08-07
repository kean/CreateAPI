import Foundation
    
public struct EntityExclude: RawRepresentable, Codable, Hashable {
    public var name: String
    public var property: String?

    public init(name: String, property: String?) {
        self.name = name
        self.property = property
    }

    public init?(rawValue: String) {
        let components = rawValue.components(separatedBy: ".")
        switch components.count {
        case 1:
            self.init(name: components[0], property: nil)
        case 2:
            self.init(name: components[0], property: components[1])
        default:
            return nil
        }
    }

    public var rawValue: String {
        if let property = property {
            return "\(name).\(property)"
        } else {
            return name
        }
    }
}
