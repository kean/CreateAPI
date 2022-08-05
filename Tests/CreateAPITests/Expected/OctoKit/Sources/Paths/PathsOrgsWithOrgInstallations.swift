// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.Orgs.WithOrg {
    public var installations: Installations {
        Installations(path: path + "/installations")
    }

    public struct Installations {
        /// Path: `/orgs/{org}/installations`
        public let path: String

        /// List app installations for an organization
        ///
        /// Lists all GitHub Apps in an organization. The installation count includes all GitHub Apps installed on repositories in the organization. You must be an organization owner with `admin:read` scope to use this endpoint.
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/orgs#list-app-installations-for-an-organization)
        public func get(perPage: Int? = nil, page: Int? = nil) -> Request<GetResponse> {
            Request(method: "GET", url: path, query: makeGetQuery(perPage, page), id: "orgs/list-app-installations")
        }

        public struct GetResponse: Decodable {
            public var totalCount: Int
            public var installations: [OctoKit.Installation]

            public init(totalCount: Int, installations: [OctoKit.Installation]) {
                self.totalCount = totalCount
                self.installations = installations
            }

            public init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: StringCodingKey.self)
                self.totalCount = try values.decode(Int.self, forKey: "total_count")
                self.installations = try values.decode([OctoKit.Installation].self, forKey: "installations")
            }
        }

        public enum GetResponseHeaders {
            public static let link = HTTPHeader<String>(field: "Link")
        }

        private func makeGetQuery(_ perPage: Int?, _ page: Int?) -> [(String, String?)] {
            let encoder = URLQueryEncoder()
            encoder.encode(perPage, forKey: "per_page")
            encoder.encode(page, forKey: "page")
            return encoder.items
        }
    }
}
