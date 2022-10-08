// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths {
    public static var organizations: Organizations {
        Organizations(path: "/organizations")
    }

    public struct Organizations {
        /// Path: `/organizations`
        public let path: String

        /// List organizations
        ///
        /// Lists all organizations, in the order that they were created on GitHub.
        /// 
        /// **Note:** Pagination is powered exclusively by the `since` parameter. Use the [Link header](https://docs.github.com/rest/overview/resources-in-the-rest-api#link-header) to get the URL for the next page of organizations.
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/orgs#list-organizations)
        public func get(since: Int? = nil, perPage: Int? = nil) -> Request<[OctoKit.OrganizationSimple]> {
            Request(path: path, method: "GET", query: makeGetQuery(since, perPage), id: "orgs/list")
        }

        public enum GetResponseHeaders {
            public static let link = HTTPHeader<String>(field: "Link")
        }

        private func makeGetQuery(_ since: Int?, _ perPage: Int?) -> [(String, String?)] {
            let encoder = URLQueryEncoder()
            encoder.encode(since, forKey: "since")
            encoder.encode(perPage, forKey: "per_page")
            return encoder.items
        }
    }
}
