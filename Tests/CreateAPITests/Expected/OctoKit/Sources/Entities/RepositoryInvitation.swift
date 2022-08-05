// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import NaiveDate

/// Repository invitations let you manage who you collaborate with.
public struct RepositoryInvitation: Codable {
    /// Unique identifier of the repository invitation.
    ///
    /// Example: 42
    public var id: Int
    /// Minimal Repository
    public var repository: MinimalRepository
    /// Simple User
    public var invitee: SimpleUser?
    /// Simple User
    public var inviter: SimpleUser?
    /// The permission associated with the invitation.
    ///
    /// Example: "read"
    public var permissions: Permissions
    /// Example: "2016-06-13T14:52:50-05:00"
    public var createdAt: Date
    /// Whether or not the invitation has expired
    public var isExpired: Bool?
    /// URL for the repository invitation
    ///
    /// Example: "https://api.github.com/user/repository-invitations/1"
    public var url: String
    /// Example: "https://github.com/octocat/Hello-World/invitations"
    public var htmlURL: String
    public var nodeID: String

    /// The permission associated with the invitation.
    ///
    /// Example: "read"
    public enum Permissions: String, Codable, CaseIterable {
        case read
        case write
        case admin
        case triage
        case maintain
    }

    public init(id: Int, repository: MinimalRepository, invitee: SimpleUser? = nil, inviter: SimpleUser? = nil, permissions: Permissions, createdAt: Date, isExpired: Bool? = nil, url: String, htmlURL: String, nodeID: String) {
        self.id = id
        self.repository = repository
        self.invitee = invitee
        self.inviter = inviter
        self.permissions = permissions
        self.createdAt = createdAt
        self.isExpired = isExpired
        self.url = url
        self.htmlURL = htmlURL
        self.nodeID = nodeID
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.id = try values.decode(Int.self, forKey: "id")
        self.repository = try values.decode(MinimalRepository.self, forKey: "repository")
        self.invitee = try values.decodeIfPresent(SimpleUser.self, forKey: "invitee")
        self.inviter = try values.decodeIfPresent(SimpleUser.self, forKey: "inviter")
        self.permissions = try values.decode(Permissions.self, forKey: "permissions")
        self.createdAt = try values.decode(Date.self, forKey: "created_at")
        self.isExpired = try values.decodeIfPresent(Bool.self, forKey: "expired")
        self.url = try values.decode(String.self, forKey: "url")
        self.htmlURL = try values.decode(String.self, forKey: "html_url")
        self.nodeID = try values.decode(String.self, forKey: "node_id")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(id, forKey: "id")
        try values.encode(repository, forKey: "repository")
        try values.encodeIfPresent(invitee, forKey: "invitee")
        try values.encodeIfPresent(inviter, forKey: "inviter")
        try values.encode(permissions, forKey: "permissions")
        try values.encode(createdAt, forKey: "created_at")
        try values.encodeIfPresent(isExpired, forKey: "expired")
        try values.encode(url, forKey: "url")
        try values.encode(htmlURL, forKey: "html_url")
        try values.encode(nodeID, forKey: "node_id")
    }
}
