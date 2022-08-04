// Generated by Create API
// https://github.com/CreateAPI/CreateAPI
//
// swiftlint:disable all

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.Repos.WithOwner.WithRepo.Pulls.WithPullNumber.Reviews.WithReviewID {
    public var comments: Comments {
        Comments(path: path + "/comments")
    }

    public struct Comments {
        /// Path: `/repos/{owner}/{repo}/pulls/{pull_number}/reviews/{review_id}/comments`
        public let path: String

        /// List comments for a pull request review
        ///
        /// List comments for a specific pull request review.
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/pulls#list-comments-for-a-pull-request-review)
        public func get(perPage: Int? = nil, page: Int? = nil) -> Request<[OctoKit.ReviewComment]> {
            Request(method: "GET", url: path, query: makeGetQuery(perPage, page), id: "pulls/list-comments-for-review")
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
