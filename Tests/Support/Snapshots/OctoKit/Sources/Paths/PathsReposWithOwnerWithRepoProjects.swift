// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.Repos.WithOwner.WithRepo {
    public var projects: Projects {
        Projects(path: path + "/projects")
    }

    public struct Projects {
        /// Path: `/repos/{owner}/{repo}/projects`
        public let path: String

        /// List repository projects
        ///
        /// Lists the projects in a repository. Returns a `404 Not Found` status if projects are disabled in the repository. If you do not have sufficient privileges to perform this action, a `401 Unauthorized` or `410 Gone` status is returned.
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/projects#list-repository-projects)
        public func get(parameters: GetParameters? = nil) -> Request<[OctoKit.Project]> {
            Request(path: path, method: "GET", query: parameters?.asQuery, id: "projects/list-for-repo")
        }

        public enum GetResponseHeaders {
            public static let link = HTTPHeader<String>(field: "Link")
        }

        public struct GetParameters {
            public var state: State?
            public var perPage: Int?
            public var page: Int?

            public enum State: String, Codable, CaseIterable {
                case `open`
                case closed
                case all
            }

            public init(state: State? = nil, perPage: Int? = nil, page: Int? = nil) {
                self.state = state
                self.perPage = perPage
                self.page = page
            }

            public var asQuery: [(String, String?)] {
                let encoder = URLQueryEncoder()
                encoder.encode(state, forKey: "state")
                encoder.encode(perPage, forKey: "per_page")
                encoder.encode(page, forKey: "page")
                return encoder.items
            }
        }

        /// Create a repository project
        ///
        /// Creates a repository project board. Returns a `404 Not Found` status if projects are disabled in the repository. If you do not have sufficient privileges to perform this action, a `401 Unauthorized` or `410 Gone` status is returned.
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/projects#create-a-repository-project)
        public func post(_ body: PostRequest) -> Request<OctoKit.Project> {
            Request(path: path, method: "POST", body: body, id: "projects/create-for-repo")
        }

        public struct PostRequest: Encodable {
            /// The name of the project.
            public var name: String
            /// The description of the project.
            public var body: String?

            public init(name: String, body: String? = nil) {
                self.name = name
                self.body = body
            }

            public func encode(to encoder: Encoder) throws {
                var values = encoder.container(keyedBy: StringCodingKey.self)
                try values.encode(name, forKey: "name")
                try values.encodeIfPresent(body, forKey: "body")
            }
        }
    }
}
