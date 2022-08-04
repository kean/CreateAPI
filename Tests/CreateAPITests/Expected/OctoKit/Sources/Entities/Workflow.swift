// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import NaiveDate

/// A GitHub Actions workflow
public struct Workflow: Codable {
    public var id: Int
    /// Example: "MDg6V29ya2Zsb3cxMg=="
    public var nodeID: String
    /// Example: "CI"
    public var name: String
    /// Example: "ruby.yaml"
    public var path: String
    /// Example: "active"
    public var state: State
    /// Example: "2019-12-06T14:20:20.000Z"
    public var createdAt: Date
    /// Example: "2019-12-06T14:20:20.000Z"
    public var updatedAt: Date
    /// Example: "https://api.github.com/repos/actions/setup-ruby/workflows/5"
    public var url: String
    /// Example: "https://github.com/actions/setup-ruby/blob/master/.github/workflows/ruby.yaml"
    public var htmlURL: String
    /// Example: "https://github.com/actions/setup-ruby/workflows/CI/badge.svg"
    public var badgeURL: String
    /// Example: "2019-12-06T14:20:20.000Z"
    public var deletedAt: Date?

    /// Example: "active"
    public enum State: String, Codable, CaseIterable {
        case active
        case deleted
        case disabledFork = "disabled_fork"
        case disabledInactivity = "disabled_inactivity"
        case disabledManually = "disabled_manually"
    }

    public init(id: Int, nodeID: String, name: String, path: String, state: State, createdAt: Date, updatedAt: Date, url: String, htmlURL: String, badgeURL: String, deletedAt: Date? = nil) {
        self.id = id
        self.nodeID = nodeID
        self.name = name
        self.path = path
        self.state = state
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.url = url
        self.htmlURL = htmlURL
        self.badgeURL = badgeURL
        self.deletedAt = deletedAt
    }

    private enum CodingKeys: String, CodingKey {
        case id
        case nodeID = "node_id"
        case name
        case path
        case state
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case url
        case htmlURL = "html_url"
        case badgeURL = "badge_url"
        case deletedAt = "deleted_at"
    }
}
