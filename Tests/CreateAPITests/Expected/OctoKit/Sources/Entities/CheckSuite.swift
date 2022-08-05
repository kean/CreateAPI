// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import NaiveDate

/// A suite of checks performed on the code of a given code change
public struct CheckSuite: Codable {
    public var id: Int
    /// Example: "MDEwOkNoZWNrU3VpdGU1"
    public var nodeID: String
    /// Example: "master"
    public var headBranch: String?
    /// The SHA of the head commit that is being checked.
    ///
    /// Example: "009b8a3a9ccbb128af87f9b1c0f4c62e8a304f6d"
    public var headSha: String
    /// Example: "completed"
    public var status: Status?
    /// Example: "neutral"
    public var conclusion: Conclusion?
    /// Example: "https://api.github.com/repos/github/hello-world/check-suites/5"
    public var url: String?
    /// Example: "146e867f55c26428e5f9fade55a9bbf5e95a7912"
    public var before: String?
    /// Example: "d6fde92930d4715a2b49857d24b940956b26d2d3"
    public var after: String?
    public var pullRequests: [PullRequestMinimal]?
    /// GitHub app
    ///
    /// GitHub apps are a new way to extend GitHub. They can be installed directly on organizations and user accounts and granted access to specific repositories. They come with granular permissions and built-in webhooks. GitHub apps are first class actors within GitHub.
    public var app: Integration?
    /// Minimal Repository
    public var repository: MinimalRepository
    public var createdAt: Date?
    public var updatedAt: Date?
    /// Simple Commit
    public var headCommit: SimpleCommit
    public var latestCheckRunsCount: Int
    public var checkRunsURL: String
    public var isRerequestable: Bool?
    public var isRunsRerequestable: Bool?

    /// Example: "completed"
    public enum Status: String, Codable, CaseIterable {
        case queued
        case inProgress = "in_progress"
        case completed
    }

    /// Example: "neutral"
    public enum Conclusion: String, Codable, CaseIterable {
        case success
        case failure
        case neutral
        case cancelled
        case skipped
        case timedOut = "timed_out"
        case actionRequired = "action_required"
    }

    public init(id: Int, nodeID: String, headBranch: String? = nil, headSha: String, status: Status? = nil, conclusion: Conclusion? = nil, url: String? = nil, before: String? = nil, after: String? = nil, pullRequests: [PullRequestMinimal]? = nil, app: Integration? = nil, repository: MinimalRepository, createdAt: Date? = nil, updatedAt: Date? = nil, headCommit: SimpleCommit, latestCheckRunsCount: Int, checkRunsURL: String, isRerequestable: Bool? = nil, isRunsRerequestable: Bool? = nil) {
        self.id = id
        self.nodeID = nodeID
        self.headBranch = headBranch
        self.headSha = headSha
        self.status = status
        self.conclusion = conclusion
        self.url = url
        self.before = before
        self.after = after
        self.pullRequests = pullRequests
        self.app = app
        self.repository = repository
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.headCommit = headCommit
        self.latestCheckRunsCount = latestCheckRunsCount
        self.checkRunsURL = checkRunsURL
        self.isRerequestable = isRerequestable
        self.isRunsRerequestable = isRunsRerequestable
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.id = try values.decode(Int.self, forKey: "id")
        self.nodeID = try values.decode(String.self, forKey: "node_id")
        self.headBranch = try values.decodeIfPresent(String.self, forKey: "head_branch")
        self.headSha = try values.decode(String.self, forKey: "head_sha")
        self.status = try values.decodeIfPresent(Status.self, forKey: "status")
        self.conclusion = try values.decodeIfPresent(Conclusion.self, forKey: "conclusion")
        self.url = try values.decodeIfPresent(String.self, forKey: "url")
        self.before = try values.decodeIfPresent(String.self, forKey: "before")
        self.after = try values.decodeIfPresent(String.self, forKey: "after")
        self.pullRequests = try values.decodeIfPresent([PullRequestMinimal].self, forKey: "pull_requests")
        self.app = try values.decodeIfPresent(Integration.self, forKey: "app")
        self.repository = try values.decode(MinimalRepository.self, forKey: "repository")
        self.createdAt = try values.decodeIfPresent(Date.self, forKey: "created_at")
        self.updatedAt = try values.decodeIfPresent(Date.self, forKey: "updated_at")
        self.headCommit = try values.decode(SimpleCommit.self, forKey: "head_commit")
        self.latestCheckRunsCount = try values.decode(Int.self, forKey: "latest_check_runs_count")
        self.checkRunsURL = try values.decode(String.self, forKey: "check_runs_url")
        self.isRerequestable = try values.decodeIfPresent(Bool.self, forKey: "rerequestable")
        self.isRunsRerequestable = try values.decodeIfPresent(Bool.self, forKey: "runs_rerequestable")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(id, forKey: "id")
        try values.encode(nodeID, forKey: "node_id")
        try values.encodeIfPresent(headBranch, forKey: "head_branch")
        try values.encode(headSha, forKey: "head_sha")
        try values.encodeIfPresent(status, forKey: "status")
        try values.encodeIfPresent(conclusion, forKey: "conclusion")
        try values.encodeIfPresent(url, forKey: "url")
        try values.encodeIfPresent(before, forKey: "before")
        try values.encodeIfPresent(after, forKey: "after")
        try values.encodeIfPresent(pullRequests, forKey: "pull_requests")
        try values.encodeIfPresent(app, forKey: "app")
        try values.encode(repository, forKey: "repository")
        try values.encodeIfPresent(createdAt, forKey: "created_at")
        try values.encodeIfPresent(updatedAt, forKey: "updated_at")
        try values.encode(headCommit, forKey: "head_commit")
        try values.encode(latestCheckRunsCount, forKey: "latest_check_runs_count")
        try values.encode(checkRunsURL, forKey: "check_runs_url")
        try values.encodeIfPresent(isRerequestable, forKey: "rerequestable")
        try values.encodeIfPresent(isRunsRerequestable, forKey: "runs_rerequestable")
    }
}
