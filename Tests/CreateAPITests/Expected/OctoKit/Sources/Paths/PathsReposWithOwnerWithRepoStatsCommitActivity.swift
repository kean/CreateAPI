// Generated by Create API
// https://github.com/CreateAPI/CreateAPI
//
// swiftlint:disable all

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.Repos.WithOwner.WithRepo.Stats {
    public var commitActivity: CommitActivity {
        CommitActivity(path: path + "/commit_activity")
    }

    public struct CommitActivity {
        /// Path: `/repos/{owner}/{repo}/stats/commit_activity`
        public let path: String

        /// Get the last year of commit activity
        ///
        /// Returns the last year of commit activity grouped by week. The `days` array is a group of commits per day, starting on `Sunday`.
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/repos#get-the-last-year-of-commit-activity)
        public var get: Request<[OctoKit.CommitActivity]> {
            Request(method: "GET", url: path, id: "repos/get-commit-activity-stats")
        }
    }
}
