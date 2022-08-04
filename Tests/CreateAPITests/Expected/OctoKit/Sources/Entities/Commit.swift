// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import NaiveDate

public struct Commit: Codable {
    /// Example: "https://api.github.com/repos/octocat/Hello-World/commits/6dcb09b5b57875f334f61aebed695e2e4193db5e"
    public var url: URL
    /// Example: "6dcb09b5b57875f334f61aebed695e2e4193db5e"
    public var sha: String
    /// Example: "MDY6Q29tbWl0NmRjYjA5YjViNTc4NzVmMzM0ZjYxYWViZWQ2OTVlMmU0MTkzZGI1ZQ=="
    public var nodeID: String
    /// Example: "https://github.com/octocat/Hello-World/commit/6dcb09b5b57875f334f61aebed695e2e4193db5e"
    public var htmlURL: URL
    /// Example: "https://api.github.com/repos/octocat/Hello-World/commits/6dcb09b5b57875f334f61aebed695e2e4193db5e/comments"
    public var commentsURL: URL
    public var commit: Commit
    /// Simple User
    public var author: SimpleUser?
    /// Simple User
    public var committer: SimpleUser?
    public var parents: [Parent]
    public var stats: Stats?
    public var files: [DiffEntry]?

    public struct Commit: Codable {
        /// Example: "https://api.github.com/repos/octocat/Hello-World/commits/6dcb09b5b57875f334f61aebed695e2e4193db5e"
        public var url: URL
        /// Git User
        ///
        /// Metaproperties for Git author/committer information.
        public var author: GitUser?
        /// Git User
        ///
        /// Metaproperties for Git author/committer information.
        public var committer: GitUser?
        /// Example: "Fix all the bugs"
        public var message: String
        public var commentCount: Int
        public var tree: Tree
        public var verification: Verification?

        public struct Tree: Codable {
            /// Example: "827efc6d56897b048c772eb4087f854f46256132"
            public var sha: String
            /// Example: "https://api.github.com/repos/octocat/Hello-World/tree/827efc6d56897b048c772eb4087f854f46256132"
            public var url: URL

            public init(sha: String, url: URL) {
                self.sha = sha
                self.url = url
            }
        }

        public init(url: URL, author: GitUser? = nil, committer: GitUser? = nil, message: String, commentCount: Int, tree: Tree, verification: Verification? = nil) {
            self.url = url
            self.author = author
            self.committer = committer
            self.message = message
            self.commentCount = commentCount
            self.tree = tree
            self.verification = verification
        }

        private enum CodingKeys: String, CodingKey {
            case url
            case author
            case committer
            case message
            case commentCount = "comment_count"
            case tree
            case verification
        }
    }

    public struct Parent: Codable {
        /// Example: "7638417db6d59f3c431d3e1f261cc637155684cd"
        public var sha: String
        /// Example: "https://api.github.com/repos/octocat/Hello-World/commits/7638417db6d59f3c431d3e1f261cc637155684cd"
        public var url: URL
        /// Example: "https://github.com/octocat/Hello-World/commit/7638417db6d59f3c431d3e1f261cc637155684cd"
        public var htmlURL: URL?

        public init(sha: String, url: URL, htmlURL: URL? = nil) {
            self.sha = sha
            self.url = url
            self.htmlURL = htmlURL
        }

        private enum CodingKeys: String, CodingKey {
            case sha
            case url
            case htmlURL = "html_url"
        }
    }

    public struct Stats: Codable {
        public var additions: Int?
        public var deletions: Int?
        public var total: Int?

        public init(additions: Int? = nil, deletions: Int? = nil, total: Int? = nil) {
            self.additions = additions
            self.deletions = deletions
            self.total = total
        }
    }

    public init(url: URL, sha: String, nodeID: String, htmlURL: URL, commentsURL: URL, commit: Commit, author: SimpleUser? = nil, committer: SimpleUser? = nil, parents: [Parent], stats: Stats? = nil, files: [DiffEntry]? = nil) {
        self.url = url
        self.sha = sha
        self.nodeID = nodeID
        self.htmlURL = htmlURL
        self.commentsURL = commentsURL
        self.commit = commit
        self.author = author
        self.committer = committer
        self.parents = parents
        self.stats = stats
        self.files = files
    }

    private enum CodingKeys: String, CodingKey {
        case url
        case sha
        case nodeID = "node_id"
        case htmlURL = "html_url"
        case commentsURL = "comments_url"
        case commit
        case author
        case committer
        case parents
        case stats
        case files
    }
}
