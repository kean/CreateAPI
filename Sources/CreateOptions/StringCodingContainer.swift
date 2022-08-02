import Foundation

class StringCodingContainer<K: RawRepresentable & Hashable> where K.RawValue == String {
    let container: KeyedDecodingContainer<StringCodingKey>
    private let recorder: IssueRecorder?
    private var decoded: Set<StringCodingKey> = []

    init(decoder: Decoder) throws {
        container = try decoder.container(keyedBy: StringCodingKey.self)
        recorder = decoder.userInfo[.issueRecorder] as? IssueRecorder
    }

    func decode<T: Decodable>(_ type: T.Type, forKey key: K, defaultValue: T) throws -> T {
        let key = StringCodingKey(string: key.rawValue)
        let value = try container.decodeIfPresent(type, forKey: key) ?? defaultValue
        decoded.insert(key)
        return value
    }

    /// Ask the container to record any issues that it spotted during decoding if an issue recorder was passed in the user info.
    func recordPotentialIssues(deprecations: [(key: K, message: String)]) {
        guard let recorder = recorder else { return }
        let deprecations = deprecations.map { (StringCodingKey(string: $0.key.rawValue), $0.message) }

        for key in container.allKeys where !decoded.contains(key) {
            recorder.record(.unexpected, key: key, path: container.codingPath)
        }

        for (key, message) in deprecations where container.allKeys.contains(key) {
            recorder.record(.deprecated, key: key, path: container.codingPath, message: message)
        }
    }
}

extension KeyedDecodingContainer {
    func decode<T: Decodable>(_ type: T.Type, forKey key: K, defaultValue: T) throws -> T {
        try decodeIfPresent(type, forKey: key) ?? defaultValue
    }
}
