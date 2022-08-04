// Generated by Create API
// https://github.com/CreateAPI/CreateAPI
//
// swiftlint:disable all

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.Repos.WithOwner.WithRepo {
    public var comments: Comments {
        Comments(path: path + "/comments")
    }

    public struct Comments {
        /// Path: `/repos/{owner}/{repo}/comments`
        public let path: String

        /// List commit comments for a repository
        ///
        /// Commit Comments use [these custom media types](https://docs.github.com/rest/reference/repos#custom-media-types). You can read more about the use of media types in the API [here](https://docs.github.com/rest/overview/media-types/).
        /// 
        /// Comments are ordered by ascending ID.
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/repos#list-commit-comments-for-a-repository)
        public func get(perPage: Int? = nil, page: Int? = nil) -> Request<[OctoKit.CommitComment]> {
            Request(method: "GET", url: path, query: makeGetQuery(perPage, page), id: "repos/list-commit-comments-for-repo")
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
