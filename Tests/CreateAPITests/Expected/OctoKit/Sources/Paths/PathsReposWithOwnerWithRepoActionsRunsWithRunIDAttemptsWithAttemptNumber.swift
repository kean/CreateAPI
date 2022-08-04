// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.Repos.WithOwner.WithRepo.Actions.Runs.WithRunID.Attempts {
    public func attemptNumber(_ attemptNumber: Int) -> WithAttemptNumber {
        WithAttemptNumber(path: "\(path)/\(attemptNumber)")
    }

    public struct WithAttemptNumber {
        /// Path: `/repos/{owner}/{repo}/actions/runs/{run_id}/attempts/{attempt_number}`
        public let path: String

        /// Get a workflow run attempt
        ///
        /// Gets a specific workflow run attempt. Anyone with read access to the repository
        /// can use this endpoint. If the repository is private you must use an access token
        /// with the `repo` scope. GitHub Apps must have the `actions:read` permission to
        /// use this endpoint.
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/actions#get-a-workflow-run-attempt)
        public func get(excludePullRequests: Bool? = nil) -> Request<OctoKit.WorkflowRun> {
            Request(method: "GET", url: path, query: makeGetQuery(excludePullRequests), id: "actions/get-workflow-run-attempt")
        }

        private func makeGetQuery(_ excludePullRequests: Bool?) -> [(String, String?)] {
            let encoder = URLQueryEncoder()
            encoder.encode(excludePullRequests, forKey: "exclude_pull_requests")
            return encoder.items
        }
    }
}
