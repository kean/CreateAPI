// Generated by Create API
// https://github.com/CreateAPI/CreateAPI
//
// swiftlint:disable all

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.Repos.WithOwner.WithRepo.Commits.WithCommitSha {
    public var pulls: Pulls {
        Pulls(path: path + "/pulls")
    }

    public struct Pulls {
        /// Path: `/repos/{owner}/{repo}/commits/{commit_sha}/pulls`
        public let path: String

        /// List pull requests associated with a commit
        ///
        /// Lists the merged pull request that introduced the commit to the repository. If the commit is not present in the default branch, additionally returns open pull requests associated with the commit. The results may include open and closed pull requests. Additional preview headers may be required to see certain details for associated pull requests, such as whether a pull request is in a draft state. For more information about previews that might affect this endpoint, see the [List pull requests](https://docs.github.com/rest/reference/pulls#list-pull-requests) endpoint.
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/repos#list-pull-requests-associated-with-a-commit)
        public func get(perPage: Int? = nil, page: Int? = nil) -> Request<[OctoKit.PullRequestSimple]> {
            Request(method: "GET", url: path, query: makeGetQuery(perPage, page))
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