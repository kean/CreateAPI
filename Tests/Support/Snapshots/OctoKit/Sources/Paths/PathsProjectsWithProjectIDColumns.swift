// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.Projects.WithProjectID {
    public var columns: Columns {
        Columns(path: path + "/columns")
    }

    public struct Columns {
        /// Path: `/projects/{project_id}/columns`
        public let path: String

        /// List project columns
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/projects#list-project-columns)
        public func get(perPage: Int? = nil, page: Int? = nil) -> Request<[OctoKit.ProjectColumn]> {
            Request(path: path, method: "GET", query: makeGetQuery(perPage, page), id: "projects/list-columns")
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

        /// Create a project column
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/projects#create-a-project-column)
        public func post(name: String) -> Request<OctoKit.ProjectColumn> {
            Request(path: path, method: "POST", body: ["name": name], id: "projects/create-column")
        }
    }
}
