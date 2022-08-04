// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.Search {
    public var users: Users {
        Users(path: path + "/users")
    }

    public struct Users {
        /// Path: `/search/users`
        public let path: String

        /// Search users
        ///
        /// Find users via various criteria. This method returns up to 100 results [per page](https://docs.github.com/rest/overview/resources-in-the-rest-api#pagination).
        /// 
        /// When searching for users, you can get text match metadata for the issue **login**, **email**, and **name** fields when you pass the `text-match` media type. For more details about highlighting search results, see [Text match metadata](https://docs.github.com/rest/reference/search#text-match-metadata). For more details about how to receive highlighted search results, see [Text match metadata](https://docs.github.com/rest/reference/search#text-match-metadata).
        /// 
        /// For example, if you're looking for a list of popular users, you might try this query:
        /// 
        /// `q=tom+repos:%3E42+followers:%3E1000`
        /// 
        /// This query searches for users with the name `tom`. The results are restricted to users with more than 42 repositories and over 1,000 followers.
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/search#search-users)
        public func get(parameters: GetParameters) -> Request<GetResponse> {
            Request(method: "GET", url: path, query: parameters.asQuery, id: "search/users")
        }

        public struct GetResponse: Decodable {
            public var totalCount: Int
            public var isIncompleteResults: Bool
            public var items: [OctoKit.UserSearchResultItem]

            public init(totalCount: Int, isIncompleteResults: Bool, items: [OctoKit.UserSearchResultItem]) {
                self.totalCount = totalCount
                self.isIncompleteResults = isIncompleteResults
                self.items = items
            }

            private enum CodingKeys: String, CodingKey {
                case totalCount = "total_count"
                case isIncompleteResults = "incomplete_results"
                case items
            }
        }

        public struct GetParameters {
            public var q: String
            public var sort: Sort?
            public var order: Order?
            public var perPage: Int?
            public var page: Int?

            public enum Sort: String, Codable, CaseIterable {
                case followers
                case repositories
                case joined
            }

            public enum Order: String, Codable, CaseIterable {
                case desc
                case asc
            }

            public init(q: String, sort: Sort? = nil, order: Order? = nil, perPage: Int? = nil, page: Int? = nil) {
                self.q = q
                self.sort = sort
                self.order = order
                self.perPage = perPage
                self.page = page
            }

            public var asQuery: [(String, String?)] {
                let encoder = URLQueryEncoder()
                encoder.encode(q, forKey: "q")
                encoder.encode(sort, forKey: "sort")
                encoder.encode(order, forKey: "order")
                encoder.encode(perPage, forKey: "per_page")
                encoder.encode(page, forKey: "page")
                return encoder.items
            }
        }
    }
}
