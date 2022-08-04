// Generated by Create API
// https://github.com/CreateAPI/CreateAPI
//
// swiftlint:disable all

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.Repos.WithOwner.WithRepo.Pulls.WithPullNumber {
    public var commits: Commits {
        Commits(path: path + "/commits")
    }

    public struct Commits {
        /// Path: `/repos/{owner}/{repo}/pulls/{pull_number}/commits`
        public let path: String

        /// List commits on a pull request
        ///
        /// Lists a maximum of 250 commits for a pull request. To receive a complete commit list for pull requests with more than 250 commits, use the [List commits](https://docs.github.com/rest/reference/repos#list-commits) endpoint.
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/pulls#list-commits-on-a-pull-request)
        public func get(perPage: Int? = nil, page: Int? = nil) -> Request<[OctoKit.Commit]> {
            Request(method: "GET", url: path, query: makeGetQuery(perPage, page), id: "pulls/list-commits")
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
