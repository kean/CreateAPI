// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import NaiveDate

public struct ReviewDismissedIssueEvent: Codable {
    public var id: Int
    public var nodeID: String
    public var url: String
    /// Simple User
    public var actor: SimpleUser
    public var event: String
    public var commitID: String?
    public var commitURL: String?
    public var createdAt: String
    /// GitHub app
    ///
    /// GitHub apps are a new way to extend GitHub. They can be installed directly on organizations and user accounts and granted access to specific repositories. They come with granular permissions and built-in webhooks. GitHub apps are first class actors within GitHub.
    public var performedViaGithubApp: Integration?
    public var dismissedReview: DismissedReview

    public struct DismissedReview: Codable {
        public var state: String
        public var reviewID: Int
        public var dismissalMessage: String?
        public var dismissalCommitID: String?

        public init(state: String, reviewID: Int, dismissalMessage: String? = nil, dismissalCommitID: String? = nil) {
            self.state = state
            self.reviewID = reviewID
            self.dismissalMessage = dismissalMessage
            self.dismissalCommitID = dismissalCommitID
        }

        public init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: StringCodingKey.self)
            self.state = try values.decode(String.self, forKey: "state")
            self.reviewID = try values.decode(Int.self, forKey: "review_id")
            self.dismissalMessage = try values.decodeIfPresent(String.self, forKey: "dismissal_message")
            self.dismissalCommitID = try values.decodeIfPresent(String.self, forKey: "dismissal_commit_id")
        }

        public func encode(to encoder: Encoder) throws {
            var values = encoder.container(keyedBy: StringCodingKey.self)
            try values.encode(state, forKey: "state")
            try values.encode(reviewID, forKey: "review_id")
            try values.encodeIfPresent(dismissalMessage, forKey: "dismissal_message")
            try values.encodeIfPresent(dismissalCommitID, forKey: "dismissal_commit_id")
        }
    }

    public init(id: Int, nodeID: String, url: String, actor: SimpleUser, event: String, commitID: String? = nil, commitURL: String? = nil, createdAt: String, performedViaGithubApp: Integration? = nil, dismissedReview: DismissedReview) {
        self.id = id
        self.nodeID = nodeID
        self.url = url
        self.actor = actor
        self.event = event
        self.commitID = commitID
        self.commitURL = commitURL
        self.createdAt = createdAt
        self.performedViaGithubApp = performedViaGithubApp
        self.dismissedReview = dismissedReview
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.id = try values.decode(Int.self, forKey: "id")
        self.nodeID = try values.decode(String.self, forKey: "node_id")
        self.url = try values.decode(String.self, forKey: "url")
        self.actor = try values.decode(SimpleUser.self, forKey: "actor")
        self.event = try values.decode(String.self, forKey: "event")
        self.commitID = try values.decodeIfPresent(String.self, forKey: "commit_id")
        self.commitURL = try values.decodeIfPresent(String.self, forKey: "commit_url")
        self.createdAt = try values.decode(String.self, forKey: "created_at")
        self.performedViaGithubApp = try values.decodeIfPresent(Integration.self, forKey: "performed_via_github_app")
        self.dismissedReview = try values.decode(DismissedReview.self, forKey: "dismissed_review")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(id, forKey: "id")
        try values.encode(nodeID, forKey: "node_id")
        try values.encode(url, forKey: "url")
        try values.encode(actor, forKey: "actor")
        try values.encode(event, forKey: "event")
        try values.encodeIfPresent(commitID, forKey: "commit_id")
        try values.encodeIfPresent(commitURL, forKey: "commit_url")
        try values.encode(createdAt, forKey: "created_at")
        try values.encodeIfPresent(performedViaGithubApp, forKey: "performed_via_github_app")
        try values.encode(dismissedReview, forKey: "dismissed_review")
    }
}