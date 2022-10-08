// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.Repos.WithOwner.WithRepo.Issues {
    public func issueNumber(_ issueNumber: Int) -> WithIssueNumber {
        WithIssueNumber(path: "\(path)/\(issueNumber)")
    }

    public struct WithIssueNumber {
        /// Path: `/repos/{owner}/{repo}/issues/{issue_number}`
        public let path: String

        /// Get an issue
        ///
        /// The API returns a [`301 Moved Permanently` status](https://docs.github.com/rest/overview/resources-in-the-rest-api#http-redirects-redirects) if the issue was
        /// [transferred](https://help.github.com/articles/transferring-an-issue-to-another-repository/) to another repository. If
        /// the issue was transferred to or deleted from a repository where the authenticated user lacks read access, the API
        /// returns a `404 Not Found` status. If the issue was deleted from a repository where the authenticated user has read
        /// access, the API returns a `410 Gone` status. To receive webhook events for transferred and deleted issues, subscribe
        /// to the [`issues`](https://docs.github.com/webhooks/event-payloads/#issues) webhook.
        /// 
        /// **Note**: GitHub's REST API v3 considers every pull request an issue, but not every issue is a pull request. For this
        /// reason, "Issues" endpoints may return both issues and pull requests in the response. You can identify pull requests by
        /// the `pull_request` key. Be aware that the `id` of a pull request returned from "Issues" endpoints will be an _issue id_. To find out the pull
        /// request id, use the "[List pull requests](https://docs.github.com/rest/reference/pulls#list-pull-requests)" endpoint.
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/issues#get-an-issue)
        public var get: Request<OctoKit.Issue> {
            Request(path: path, method: "GET", id: "issues/get")
        }

        /// Update an issue
        ///
        /// Issue owners and users with push access can edit an issue.
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/issues/#update-an-issue)
        public func patch(_ body: PatchRequest? = nil) -> Request<OctoKit.Issue> {
            Request(path: path, method: "PATCH", body: body, id: "issues/update")
        }

        public struct PatchRequest: Encodable {
            /// The title of the issue.
            public var title: Title?
            /// The contents of the issue.
            public var body: String?
            /// Login for the user that this issue should be assigned to. **This field is deprecated.**
            public var assignee: String?
            /// State of the issue. Either `open` or `closed`.
            public var state: State?
            public var milestone: Milestone?
            /// Labels to associate with this issue. Pass one or more Labels to _replace_ the set of Labels on this Issue. Send an empty array (`[]`) to clear all Labels from the Issue. _NOTE: Only users with push access can set labels for issues. Labels are silently dropped otherwise._
            public var labels: [Label]?
            /// Logins for Users to assign to this issue. Pass one or more user logins to _replace_ the set of assignees on this Issue. Send an empty array (`[]`) to clear all assignees from the Issue. _NOTE: Only users with push access can set assignees for new issues. Assignees are silently dropped otherwise._
            public var assignees: [String]?

            /// The title of the issue.
            public enum Title: Encodable, Hashable {
                case string(String)
                case int(Int)

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.singleValueContainer()
                    switch self {
                    case .string(let value): try container.encode(value)
                    case .int(let value): try container.encode(value)
                    }
                }
            }

            /// State of the issue. Either `open` or `closed`.
            public enum State: String, Codable, CaseIterable {
                case `open`
                case closed
            }

            public enum Milestone: Encodable, Hashable {
                case string(String)
                case int(Int)

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.singleValueContainer()
                    switch self {
                    case .string(let value): try container.encode(value)
                    case .int(let value): try container.encode(value)
                    }
                }
            }

            public enum Label: Encodable {
                case string(String)
                case object(Object)

                public struct Object: Encodable {
                    public var id: Int?
                    public var name: String?
                    public var description: String?
                    public var color: String?

                    public init(id: Int? = nil, name: String? = nil, description: String? = nil, color: String? = nil) {
                        self.id = id
                        self.name = name
                        self.description = description
                        self.color = color
                    }

                    public func encode(to encoder: Encoder) throws {
                        var values = encoder.container(keyedBy: StringCodingKey.self)
                        try values.encodeIfPresent(id, forKey: "id")
                        try values.encodeIfPresent(name, forKey: "name")
                        try values.encodeIfPresent(description, forKey: "description")
                        try values.encodeIfPresent(color, forKey: "color")
                    }
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.singleValueContainer()
                    switch self {
                    case .string(let value): try container.encode(value)
                    case .object(let value): try container.encode(value)
                    }
                }
            }

            public init(title: Title? = nil, body: String? = nil, assignee: String? = nil, state: State? = nil, milestone: Milestone? = nil, labels: [Label]? = nil, assignees: [String]? = nil) {
                self.title = title
                self.body = body
                self.assignee = assignee
                self.state = state
                self.milestone = milestone
                self.labels = labels
                self.assignees = assignees
            }

            public func encode(to encoder: Encoder) throws {
                var values = encoder.container(keyedBy: StringCodingKey.self)
                try values.encodeIfPresent(title, forKey: "title")
                try values.encodeIfPresent(body, forKey: "body")
                try values.encodeIfPresent(assignee, forKey: "assignee")
                try values.encodeIfPresent(state, forKey: "state")
                try values.encodeIfPresent(milestone, forKey: "milestone")
                try values.encodeIfPresent(labels, forKey: "labels")
                try values.encodeIfPresent(assignees, forKey: "assignees")
            }
        }
    }
}
