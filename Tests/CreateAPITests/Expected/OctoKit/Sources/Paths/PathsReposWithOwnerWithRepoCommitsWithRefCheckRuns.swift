// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.Repos.WithOwner.WithRepo.Commits.WithRef {
    public var checkRuns: CheckRuns {
        CheckRuns(path: path + "/check-runs")
    }

    public struct CheckRuns {
        /// Path: `/repos/{owner}/{repo}/commits/{ref}/check-runs`
        public let path: String

        /// List check runs for a Git reference
        ///
        /// **Note:** The Checks API only looks for pushes in the repository where the check suite or check run were created. Pushes to a branch in a forked repository are not detected and return an empty `pull_requests` array.
        /// 
        /// Lists check runs for a commit ref. The `ref` can be a SHA, branch name, or a tag name. GitHub Apps must have the `checks:read` permission on a private repository or pull access to a public repository to get check runs. OAuth Apps and authenticated users must have the `repo` scope to get check runs in a private repository.
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/checks#list-check-runs-for-a-git-reference)
        public func get(parameters: GetParameters? = nil) -> Request<GetResponse> {
            Request(method: "GET", url: path, query: parameters?.asQuery, id: "checks/list-for-ref")
        }

        public struct GetResponse: Decodable {
            public var totalCount: Int
            public var checkRuns: [OctoKit.CheckRun]

            public init(totalCount: Int, checkRuns: [OctoKit.CheckRun]) {
                self.totalCount = totalCount
                self.checkRuns = checkRuns
            }

            public init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: StringCodingKey.self)
                self.totalCount = try values.decode(Int.self, forKey: "total_count")
                self.checkRuns = try values.decode([OctoKit.CheckRun].self, forKey: "check_runs")
            }
        }

        public enum GetResponseHeaders {
            public static let link = HTTPHeader<String>(field: "Link")
        }

        public struct GetParameters {
            public var checkName: String?
            public var status: Status?
            public var filter: Filter?
            public var perPage: Int?
            public var page: Int?
            public var appID: Int?

            public enum Status: String, Codable, CaseIterable {
                case queued
                case inProgress = "in_progress"
                case completed
            }

            public enum Filter: String, Codable, CaseIterable {
                case latest
                case all
            }

            public init(checkName: String? = nil, status: Status? = nil, filter: Filter? = nil, perPage: Int? = nil, page: Int? = nil, appID: Int? = nil) {
                self.checkName = checkName
                self.status = status
                self.filter = filter
                self.perPage = perPage
                self.page = page
                self.appID = appID
            }

            public var asQuery: [(String, String?)] {
                let encoder = URLQueryEncoder()
                encoder.encode(checkName, forKey: "check_name")
                encoder.encode(status, forKey: "status")
                encoder.encode(filter, forKey: "filter")
                encoder.encode(perPage, forKey: "per_page")
                encoder.encode(page, forKey: "page")
                encoder.encode(appID, forKey: "app_id")
                return encoder.items
            }
        }
    }
}
