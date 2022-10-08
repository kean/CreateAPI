// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.Repos.WithOwner.WithRepo.Actions.Runs.WithRunID {
    public var approve: Approve {
        Approve(path: path + "/approve")
    }

    public struct Approve {
        /// Path: `/repos/{owner}/{repo}/actions/runs/{run_id}/approve`
        public let path: String

        /// Approve a workflow run for a fork pull request
        ///
        /// Approves a workflow run for a pull request from a public fork of a first time contributor. For more information, see ["Approving workflow runs from public forks](https://docs.github.com/actions/managing-workflow-runs/approving-workflow-runs-from-public-forks)."
        /// 
        /// You must authenticate using an access token with the `repo` scope to use this endpoint. GitHub Apps must have the `actions:write` permission to use this endpoint.
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/actions#approve-a-workflow-run-for-a-fork-pull-request)
        public var post: Request<Void> {
            Request(path: path, method: "POST", id: "actions/approve-workflow-run")
        }
    }
}
