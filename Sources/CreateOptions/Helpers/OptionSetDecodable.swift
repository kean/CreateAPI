import Foundation

public protocol DecodableCollection: ExpressibleByArrayLiteral {
    associatedtype Element

    init<S: Sequence>(_ sequence: S) where S.Element == Element
}

extension Set: DecodableCollection {
}

extension Array: DecodableCollection {
}

/// A helper property wrapper that allows sequences (`Set` or `Array`) that act as a set of options to be decoded in a more lenient fashion.
///
/// This property wrapper can be used on sequences where the `Element` is both `Decodable` and `CaseIterable`.
/// Decoding is prioritized in the following order:
///
/// 1. Try and decode as a `Bool`. If successful;
///     - For `true`, return a sequence of `Element.allCases`.
///     - For `false`, return an empty sequence.
/// 2. Try and decode as a single `Element` and if successful, use create a sequence with just that one element.
/// 3. Attempt to decode as a regular sequence, throw an error upon failure.
@propertyWrapper
public struct OptionSetDecodable<Wrapped: DecodableCollection & Decodable> where Wrapped.Element: CaseIterable {
    public var wrappedValue: Wrapped

    public init(wrappedValue: Wrapped) {
        self.wrappedValue = wrappedValue
    }
}

extension OptionSetDecodable: Decodable where Wrapped.Element: Decodable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()

        if let value = try? container.decode(Bool.self) {
            let sequence = value ? Wrapped(Wrapped.Element.allCases) : []
            self.init(wrappedValue: sequence)
            return
        }

        if let value = try? container.decode(Wrapped.Element.self) {
            self.init(wrappedValue: Wrapped([value]))
        }

        let value = try container.decode(Wrapped.self)
        self.init(wrappedValue: value)
    }
}
