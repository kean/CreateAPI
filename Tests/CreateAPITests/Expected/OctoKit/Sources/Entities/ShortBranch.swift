// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import NaiveDate

public struct ShortBranch: Codable {
    public var name: String
    public var commit: Commit
    public var isProtected: Bool
    /// Branch Protection
    public var protection: BranchProtection?
    public var protectionURL: URL?

    public struct Commit: Codable {
        public var sha: String
        public var url: URL

        public init(sha: String, url: URL) {
            self.sha = sha
            self.url = url
        }

        public init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: StringCodingKey.self)
            self.sha = try values.decode(String.self, forKey: "sha")
            self.url = try values.decode(URL.self, forKey: "url")
        }

        public func encode(to encoder: Encoder) throws {
            var values = encoder.container(keyedBy: StringCodingKey.self)
            try values.encode(sha, forKey: "sha")
            try values.encode(url, forKey: "url")
        }
    }

    public init(name: String, commit: Commit, isProtected: Bool, protection: BranchProtection? = nil, protectionURL: URL? = nil) {
        self.name = name
        self.commit = commit
        self.isProtected = isProtected
        self.protection = protection
        self.protectionURL = protectionURL
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.name = try values.decode(String.self, forKey: "name")
        self.commit = try values.decode(Commit.self, forKey: "commit")
        self.isProtected = try values.decode(Bool.self, forKey: "protected")
        self.protection = try values.decodeIfPresent(BranchProtection.self, forKey: "protection")
        self.protectionURL = try values.decodeIfPresent(URL.self, forKey: "protection_url")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(name, forKey: "name")
        try values.encode(commit, forKey: "commit")
        try values.encode(isProtected, forKey: "protected")
        try values.encodeIfPresent(protection, forKey: "protection")
        try values.encodeIfPresent(protectionURL, forKey: "protection_url")
    }
}
