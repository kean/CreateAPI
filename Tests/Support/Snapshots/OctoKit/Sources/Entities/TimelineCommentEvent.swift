// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import NaiveDate

public struct TimelineCommentEvent: Codable {
    public var event: String
    /// Simple User
    public var actor: SimpleUser
    /// Unique identifier of the issue comment
    ///
    /// Example: 42
    public var id: Int
    public var nodeID: String
    /// URL for the issue comment
    ///
    /// Example: "https://api.github.com/repositories/42/issues/comments/1"
    public var url: URL
    /// Contents of the issue comment
    ///
    /// Example: "What version of Safari were you using when you observed this bug?"
    public var body: String?
    public var bodyText: String?
    public var bodyHTML: String?
    public var htmlURL: URL
    /// Simple User
    public var user: SimpleUser
    /// Example: "2011-04-14T16:00:49Z"
    public var createdAt: Date
    /// Example: "2011-04-14T16:00:49Z"
    public var updatedAt: Date
    public var issueURL: URL
    /// Author_association
    ///
    /// How the author is associated with the repository.
    ///
    /// Example: "OWNER"
    public var authorAssociation: AuthorAssociation
    /// GitHub app
    ///
    /// GitHub apps are a new way to extend GitHub. They can be installed directly on organizations and user accounts and granted access to specific repositories. They come with granular permissions and built-in webhooks. GitHub apps are first class actors within GitHub.
    public var performedViaGithubApp: Integration?
    /// Reaction Rollup
    public var reactions: ReactionRollup?

    public init(event: String, actor: SimpleUser, id: Int, nodeID: String, url: URL, body: String? = nil, bodyText: String? = nil, bodyHTML: String? = nil, htmlURL: URL, user: SimpleUser, createdAt: Date, updatedAt: Date, issueURL: URL, authorAssociation: AuthorAssociation, performedViaGithubApp: Integration? = nil, reactions: ReactionRollup? = nil) {
        self.event = event
        self.actor = actor
        self.id = id
        self.nodeID = nodeID
        self.url = url
        self.body = body
        self.bodyText = bodyText
        self.bodyHTML = bodyHTML
        self.htmlURL = htmlURL
        self.user = user
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.issueURL = issueURL
        self.authorAssociation = authorAssociation
        self.performedViaGithubApp = performedViaGithubApp
        self.reactions = reactions
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.event = try values.decode(String.self, forKey: "event")
        self.actor = try values.decode(SimpleUser.self, forKey: "actor")
        self.id = try values.decode(Int.self, forKey: "id")
        self.nodeID = try values.decode(String.self, forKey: "node_id")
        self.url = try values.decode(URL.self, forKey: "url")
        self.body = try values.decodeIfPresent(String.self, forKey: "body")
        self.bodyText = try values.decodeIfPresent(String.self, forKey: "body_text")
        self.bodyHTML = try values.decodeIfPresent(String.self, forKey: "body_html")
        self.htmlURL = try values.decode(URL.self, forKey: "html_url")
        self.user = try values.decode(SimpleUser.self, forKey: "user")
        self.createdAt = try values.decode(Date.self, forKey: "created_at")
        self.updatedAt = try values.decode(Date.self, forKey: "updated_at")
        self.issueURL = try values.decode(URL.self, forKey: "issue_url")
        self.authorAssociation = try values.decode(AuthorAssociation.self, forKey: "author_association")
        self.performedViaGithubApp = try values.decodeIfPresent(Integration.self, forKey: "performed_via_github_app")
        self.reactions = try values.decodeIfPresent(ReactionRollup.self, forKey: "reactions")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(event, forKey: "event")
        try values.encode(actor, forKey: "actor")
        try values.encode(id, forKey: "id")
        try values.encode(nodeID, forKey: "node_id")
        try values.encode(url, forKey: "url")
        try values.encodeIfPresent(body, forKey: "body")
        try values.encodeIfPresent(bodyText, forKey: "body_text")
        try values.encodeIfPresent(bodyHTML, forKey: "body_html")
        try values.encode(htmlURL, forKey: "html_url")
        try values.encode(user, forKey: "user")
        try values.encode(createdAt, forKey: "created_at")
        try values.encode(updatedAt, forKey: "updated_at")
        try values.encode(issueURL, forKey: "issue_url")
        try values.encode(authorAssociation, forKey: "author_association")
        try values.encodeIfPresent(performedViaGithubApp, forKey: "performed_via_github_app")
        try values.encodeIfPresent(reactions, forKey: "reactions")
    }
}