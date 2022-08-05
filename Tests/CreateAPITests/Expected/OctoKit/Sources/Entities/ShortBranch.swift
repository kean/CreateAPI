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
    }

    public init(name: String, commit: Commit, isProtected: Bool, protection: BranchProtection? = nil, protectionURL: URL? = nil) {
        self.name = name
        self.commit = commit
        self.isProtected = isProtected
        self.protection = protection
        self.protectionURL = protectionURL
    }

    private enum CodingKeys: String, CodingKey {
        case name
        case commit
        case isProtected = "protected"
        case protection
        case protectionURL = "protection_url"
    }
}
