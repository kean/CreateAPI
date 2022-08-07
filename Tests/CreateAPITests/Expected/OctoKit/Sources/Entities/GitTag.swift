// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import NaiveDate

/// Metadata for a Git tag
public struct GitTag: Codable {
    /// Example: "MDM6VGFnOTQwYmQzMzYyNDhlZmFlMGY5ZWU1YmM3YjJkNWM5ODU4ODdiMTZhYw=="
    public var nodeID: String
    /// Name of the tag
    ///
    /// Example: "v0.0.1"
    public var tag: String
    /// Example: "940bd336248efae0f9ee5bc7b2d5c985887b16ac"
    public var sha: String
    /// URL for the tag
    ///
    /// Example: "https://api.github.com/repositories/42/git/tags/940bd336248efae0f9ee5bc7b2d5c985887b16ac"
    public var url: URL
    /// Message describing the purpose of the tag
    ///
    /// Example: "Initial public release"
    public var message: String
    public var tagger: Tagger
    public var object: Object
    public var verification: Verification?

    public struct Tagger: Codable {
        public var date: String
        public var email: String
        public var name: String

        public init(date: String, email: String, name: String) {
            self.date = date
            self.email = email
            self.name = name
        }

        public init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: StringCodingKey.self)
            self.date = try values.decode(String.self, forKey: "date")
            self.email = try values.decode(String.self, forKey: "email")
            self.name = try values.decode(String.self, forKey: "name")
        }

        public func encode(to encoder: Encoder) throws {
            var values = encoder.container(keyedBy: StringCodingKey.self)
            try values.encode(date, forKey: "date")
            try values.encode(email, forKey: "email")
            try values.encode(name, forKey: "name")
        }
    }

    public struct Object: Codable {
        public var sha: String
        public var type: String
        public var url: URL

        public init(sha: String, type: String, url: URL) {
            self.sha = sha
            self.type = type
            self.url = url
        }

        public init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: StringCodingKey.self)
            self.sha = try values.decode(String.self, forKey: "sha")
            self.type = try values.decode(String.self, forKey: "type")
            self.url = try values.decode(URL.self, forKey: "url")
        }

        public func encode(to encoder: Encoder) throws {
            var values = encoder.container(keyedBy: StringCodingKey.self)
            try values.encode(sha, forKey: "sha")
            try values.encode(type, forKey: "type")
            try values.encode(url, forKey: "url")
        }
    }

    public init(nodeID: String, tag: String, sha: String, url: URL, message: String, tagger: Tagger, object: Object, verification: Verification? = nil) {
        self.nodeID = nodeID
        self.tag = tag
        self.sha = sha
        self.url = url
        self.message = message
        self.tagger = tagger
        self.object = object
        self.verification = verification
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.nodeID = try values.decode(String.self, forKey: "node_id")
        self.tag = try values.decode(String.self, forKey: "tag")
        self.sha = try values.decode(String.self, forKey: "sha")
        self.url = try values.decode(URL.self, forKey: "url")
        self.message = try values.decode(String.self, forKey: "message")
        self.tagger = try values.decode(Tagger.self, forKey: "tagger")
        self.object = try values.decode(Object.self, forKey: "object")
        self.verification = try values.decodeIfPresent(Verification.self, forKey: "verification")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(nodeID, forKey: "node_id")
        try values.encode(tag, forKey: "tag")
        try values.encode(sha, forKey: "sha")
        try values.encode(url, forKey: "url")
        try values.encode(message, forKey: "message")
        try values.encode(tagger, forKey: "tagger")
        try values.encode(object, forKey: "object")
        try values.encodeIfPresent(verification, forKey: "verification")
    }
}
