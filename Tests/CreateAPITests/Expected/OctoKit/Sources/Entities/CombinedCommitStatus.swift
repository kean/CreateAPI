// Generated by Create API
// https://github.com/CreateAPI/CreateAPI
//
// swiftlint:disable all

import Foundation
import NaiveDate

public struct CombinedCommitStatus: Codable {
    public var state: String
    public var statuses: [SimpleCommitStatus]
    public var sha: String
    public var totalCount: Int
    /// Minimal Repository
    public var repository: MinimalRepository
    public var commitURL: URL
    public var url: URL

    public init(state: String, statuses: [SimpleCommitStatus], sha: String, totalCount: Int, repository: MinimalRepository, commitURL: URL, url: URL) {
        self.state = state
        self.statuses = statuses
        self.sha = sha
        self.totalCount = totalCount
        self.repository = repository
        self.commitURL = commitURL
        self.url = url
    }

    private enum CodingKeys: String, CodingKey {
        case state
        case statuses
        case sha
        case totalCount = "total_count"
        case repository
        case commitURL = "commit_url"
        case url
    }
}