import Foundation

class StringCodingContainer<K: RawRepresentable & Hashable> where K.RawValue == String {
    let container: KeyedDecodingContainer<StringCodingKey>
    private let recorder: IssueRecorder?
    private var decoded: Set<StringCodingKey> = []

    init(decoder: Decoder) throws {
        container = try decoder.container(keyedBy: StringCodingKey.self)
        recorder = decoder.userInfo[.issueRecorder] as? IssueRecorder
    }
}

// MARK: - Decoding
extension StringCodingContainer {
    // MARK: Base

    func decode<T: Decodable>(_ type: T.Type, forKey key: K, defaultValue: T) throws -> T {
        return try _decode(type, forKey: key, defaultValue: defaultValue)
    }

    private func _decode<T: Decodable>(_ type: T.Type, forKey key: K, defaultValue: T) throws -> T {
        return try _decode(type, forKey: key) ?? defaultValue
    }

    private func _decode<T: Decodable>(_ type: T.Type, forKey key: K) throws -> T? {
        let key = StringCodingKey(string: key.rawValue)
        let value = try container.decodeIfPresent(type, forKey: key)
        decoded.insert(key)
        return value
    }

    // MARK: Overloads

    /// When decoding to a `Set` or an `Array` with a `CaseIterable` type, also attempt the following fallbacks:
    ///
    /// 1. `true` becomes a collection of `Element.allCases`.
    /// 2. `false` becomes an empty collection.
    /// 3. A single value matching `Element` is wrapped into a collection.
    func decode<Collection: DecodableCollection & Decodable>(
        _ type: Collection.Type,
        forKey key: K,
        defaultValue: Collection
    ) throws -> Collection where Collection.Element: Decodable & CaseIterable {
        // If the key decodes as a Bool, return a collection with either all or nothing
        if let value = try? _decode(Bool.self, forKey: key) {
            return value ? Collection(Collection.Element.allCases) : []
        }

        // If the key decodes as a single value, return a collection with the one item
        if let value = try? _decode(Collection.Element.self, forKey: key) {
            return Collection([value])
        }

        // Fallback to decoding as the original type
        return try _decode(type, forKey: key, defaultValue: defaultValue)
    }

    /// When decoding to a `Set` or an `Array`, first try decoding a single value matching `Element` and wrap it into a collection
    func decode<Collection: DecodableCollection & Decodable>(
        _ type: Collection.Type,
        forKey key: K,
        defaultValue: Collection
    ) throws -> Collection where Collection.Element: Decodable {
        // If the key decodes as a single value, return a collection with the one item
        if let value = try? _decode(Collection.Element.self, forKey: key) {
            return Collection([value])
        }

        // Fallback to decoding as the original type
        return try _decode(type, forKey: key, defaultValue: defaultValue)
    }
}

// MARK: - Issue Reporting
extension StringCodingContainer {
    /// Ask the container to record any issues that it spotted during decoding if an issue recorder was passed in the user info.
    func recordPotentialIssues(
        deprecations: [(key: String, message: String)],
        replacements: [(key: String, message: String)]
    ) {
        guard let recorder = recorder else { return }
        let deprecations = deprecations.map { (StringCodingKey(string: $0.key), $0.message) }
        let replacements = Dictionary(
            replacements.map { (StringCodingKey(string: $0.key), $0.message) },
            uniquingKeysWith: { lhs, _ in lhs }
        )

        for key in container.allKeys where !decoded.contains(key) {
            if let replacement = replacements[key] {
                recorder.record(.unsupported, key: key, path: container.codingPath, message: replacement)
            } else {
                recorder.record(.unexpected, key: key, path: container.codingPath)
            }
        }

        for (key, message) in deprecations where container.allKeys.contains(key) {
            recorder.record(.deprecated, key: key, path: container.codingPath, message: message)
        }
    }
}
