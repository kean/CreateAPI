import Foundation

extension KeyedDecodingContainer {
    func decode<T: Decodable>(_ type: T.Type, forKey key: K, defaultValue: T) throws -> T {
        try decodeIfPresent(type, forKey: key) ?? defaultValue
    }
}
