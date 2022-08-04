// Generated by Create API
// https://github.com/CreateAPI/CreateAPI
//
// swiftlint:disable all

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.Repos.WithOwner.WithRepo.Pulls {
    public var comments: Comments {
        Comments(path: path + "/comments")
    }

    public struct Comments {
        /// Path: `/repos/{owner}/{repo}/pulls/comments`
        public let path: String

        /// List review comments in a repository
        ///
        /// Lists review comments for all pull requests in a repository. By default, review comments are in ascending order by ID.
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/pulls#list-review-comments-in-a-repository)
        public func get(parameters: GetParameters? = nil) -> Request<[OctoKit.PullRequestReviewComment]> {
            Request(method: "GET", url: path, query: parameters?.asQuery, id: "pulls/list-review-comments-for-repo")
        }

        public enum GetResponseHeaders {
            public static let link = HTTPHeader<String>(field: "Link")
        }

        public struct GetParameters {
            public var sort: Sort?
            public var direction: Direction?
            public var since: Date?
            public var perPage: Int?
            public var page: Int?

            public enum Sort: String, Codable, CaseIterable {
                case created
                case updated
                case createdAt = "created_at"
            }

            public enum Direction: String, Codable, CaseIterable {
                case asc
                case desc
            }

            public init(sort: Sort? = nil, direction: Direction? = nil, since: Date? = nil, perPage: Int? = nil, page: Int? = nil) {
                self.sort = sort
                self.direction = direction
                self.since = since
                self.perPage = perPage
                self.page = page
            }

            public var asQuery: [(String, String?)] {
                let encoder = URLQueryEncoder()
                encoder.encode(sort, forKey: "sort")
                encoder.encode(direction, forKey: "direction")
                encoder.encode(since, forKey: "since")
                encoder.encode(perPage, forKey: "per_page")
                encoder.encode(page, forKey: "page")
                return encoder.items
            }
        }
    }
}
