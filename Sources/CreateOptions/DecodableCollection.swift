import Foundation

protocol DecodableCollection: ExpressibleByArrayLiteral {
    associatedtype Element

    init<S: Sequence>(_ sequence: S) where S.Element == Element
}

extension Set: DecodableCollection {
}

extension Array: DecodableCollection {
}

