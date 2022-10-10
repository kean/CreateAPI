// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.Repos.WithOwner.WithRepo.Issues.WithIssueNumber {
    public var events: Events {
        Events(path: path + "/events")
    }

    public struct Events {
        /// Path: `/repos/{owner}/{repo}/issues/{issue_number}/events`
        public let path: String

        /// List issue events
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/issues#list-issue-events)
        public func get(perPage: Int? = nil, page: Int? = nil) -> Request<[OctoKit.IssueEventForIssue]> {
            Request(path: path, method: "GET", query: makeGetQuery(perPage, page), id: "issues/list-events")
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
