// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import NaiveDate

public struct TimelineUnassignedIssueEvent: Codable {
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
    /// Simple User
    public var assignee: SimpleUser

    public init(id: Int, nodeID: String, url: String, actor: SimpleUser, event: String, commitID: String? = nil, commitURL: String? = nil, createdAt: String, performedViaGithubApp: Integration? = nil, assignee: SimpleUser) {
        self.id = id
        self.nodeID = nodeID
        self.url = url
        self.actor = actor
        self.event = event
        self.commitID = commitID
        self.commitURL = commitURL
        self.createdAt = createdAt
        self.performedViaGithubApp = performedViaGithubApp
        self.assignee = assignee
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
        self.assignee = try values.decode(SimpleUser.self, forKey: "assignee")
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
        try values.encode(assignee, forKey: "assignee")
    }
}
