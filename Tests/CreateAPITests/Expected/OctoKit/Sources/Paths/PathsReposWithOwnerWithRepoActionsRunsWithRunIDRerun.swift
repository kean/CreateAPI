// Generated by Create API
// https://github.com/CreateAPI/CreateAPI
//
// swiftlint:disable all

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.Repos.WithOwner.WithRepo.Actions.Runs.WithRunID {
    public var rerun: Rerun {
        Rerun(path: path + "/rerun")
    }

    public struct Rerun {
        /// Path: `/repos/{owner}/{repo}/actions/runs/{run_id}/rerun`
        public let path: String

        /// Re-run a workflow
        ///
        /// Re-runs your workflow run using its `id`. You must authenticate using an access token with the `repo` scope to use this endpoint. GitHub Apps must have the `actions:write` permission to use this endpoint.
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/actions#re-run-a-workflow)
        @available(*, deprecated, message: "Deprecated")
        public var post: Request<Void> {
            Request(method: "POST", url: path, id: "actions/re-run-workflow")
        }
    }
}
