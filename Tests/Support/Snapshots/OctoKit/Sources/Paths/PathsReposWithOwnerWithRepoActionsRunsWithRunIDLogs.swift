// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.Repos.WithOwner.WithRepo.Actions.Runs.WithRunID {
    public var logs: Logs {
        Logs(path: path + "/logs")
    }

    public struct Logs {
        /// Path: `/repos/{owner}/{repo}/actions/runs/{run_id}/logs`
        public let path: String

        /// Download workflow run logs
        ///
        /// Gets a redirect URL to download an archive of log files for a workflow run. This link expires after 1 minute. Look for
        /// `Location:` in the response header to find the URL for the download. Anyone with read access to the repository can use
        /// this endpoint. If the repository is private you must use an access token with the `repo` scope. GitHub Apps must have
        /// the `actions:read` permission to use this endpoint.
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/actions#download-workflow-run-logs)
        public var get: Request<Void> {
            Request(path: path, method: "GET", id: "actions/download-workflow-run-logs")
        }

        /// Delete workflow run logs
        ///
        /// Deletes all logs for a workflow run. You must authenticate using an access token with the `repo` scope to use this endpoint. GitHub Apps must have the `actions:write` permission to use this endpoint.
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/actions#delete-workflow-run-logs)
        public var delete: Request<Void> {
            Request(path: path, method: "DELETE", id: "actions/delete-workflow-run-logs")
        }
    }
}
