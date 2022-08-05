// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.Orgs.WithOrg.Teams.WithTeamSlug {
    public var discussions: Discussions {
        Discussions(path: path + "/discussions")
    }

    public struct Discussions {
        /// Path: `/orgs/{org}/teams/{team_slug}/discussions`
        public let path: String

        /// List discussions
        ///
        /// List all discussions on a team's page. OAuth access tokens require the `read:discussion` [scope](https://docs.github.com/apps/building-oauth-apps/understanding-scopes-for-oauth-apps/).
        /// 
        /// **Note:** You can also specify a team by `org_id` and `team_id` using the route `GET /organizations/{org_id}/team/{team_id}/discussions`.
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/teams#list-discussions)
        public func get(parameters: GetParameters? = nil) -> Request<[OctoKit.TeamDiscussion]> {
            Request(method: "GET", url: path, query: parameters?.asQuery, id: "teams/list-discussions-in-org")
        }

        public enum GetResponseHeaders {
            public static let link = HTTPHeader<String>(field: "Link")
        }

        public struct GetParameters {
            public var direction: Direction?
            public var perPage: Int?
            public var page: Int?
            public var pinned: String?

            public enum Direction: String, Codable, CaseIterable {
                case asc
                case desc
            }

            public init(direction: Direction? = nil, perPage: Int? = nil, page: Int? = nil, pinned: String? = nil) {
                self.direction = direction
                self.perPage = perPage
                self.page = page
                self.pinned = pinned
            }

            public var asQuery: [(String, String?)] {
                let encoder = URLQueryEncoder()
                encoder.encode(direction, forKey: "direction")
                encoder.encode(perPage, forKey: "per_page")
                encoder.encode(page, forKey: "page")
                encoder.encode(pinned, forKey: "pinned")
                return encoder.items
            }
        }

        /// Create a discussion
        ///
        /// Creates a new discussion post on a team's page. OAuth access tokens require the `write:discussion` [scope](https://docs.github.com/apps/building-oauth-apps/understanding-scopes-for-oauth-apps/).
        /// 
        /// This endpoint triggers [notifications](https://docs.github.com/en/github/managing-subscriptions-and-notifications-on-github/about-notifications). Creating content too quickly using this endpoint may result in secondary rate limiting. See "[Secondary rate limits](https://docs.github.com/rest/overview/resources-in-the-rest-api#secondary-rate-limits)" and "[Dealing with secondary rate limits](https://docs.github.com/rest/guides/best-practices-for-integrators#dealing-with-secondary-rate-limits)" for details.
        /// 
        /// **Note:** You can also specify a team by `org_id` and `team_id` using the route `POST /organizations/{org_id}/team/{team_id}/discussions`.
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/teams#create-a-discussion)
        public func post(_ body: PostRequest) -> Request<OctoKit.TeamDiscussion> {
            Request(method: "POST", url: path, body: body, id: "teams/create-discussion-in-org")
        }

        public struct PostRequest: Encodable {
            /// The discussion post's title.
            public var title: String
            /// The discussion post's body text.
            public var body: String
            /// Private posts are only visible to team members, organization owners, and team maintainers. Public posts are visible to all members of the organization. Set to `true` to create a private post.
            public var isPrivate: Bool

            public init(title: String, body: String, isPrivate: Bool? = nil) {
                self.title = title
                self.body = body
                self.isPrivate = isPrivate ?? false
            }

            private enum CodingKeys: String, CodingKey {
                case title
                case body
                case isPrivate = "private"
            }
        }
    }
}
