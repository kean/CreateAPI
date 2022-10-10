// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.Enterprises.WithEnterprise.Actions.Runners {
    public func runnerID(_ runnerID: Int) -> WithRunnerID {
        WithRunnerID(path: "\(path)/\(runnerID)")
    }

    public struct WithRunnerID {
        /// Path: `/enterprises/{enterprise}/actions/runners/{runner_id}`
        public let path: String

        /// Get a self-hosted runner for an enterprise
        ///
        /// Gets a specific self-hosted runner configured in an enterprise.
        /// 
        /// You must authenticate using an access token with the `manage_runners:enterprise` scope to use this endpoint.
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/enterprise-admin#get-a-self-hosted-runner-for-an-enterprise)
        public var get: Request<OctoKit.Runner> {
            Request(path: path, method: "GET", id: "enterprise-admin/get-self-hosted-runner-for-enterprise")
        }

        /// Delete a self-hosted runner from an enterprise
        ///
        /// Forces the removal of a self-hosted runner from an enterprise. You can use this endpoint to completely remove the runner when the machine you were using no longer exists.
        /// 
        /// You must authenticate using an access token with the `manage_runners:enterprise` scope to use this endpoint.
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/enterprise-admin#delete-self-hosted-runner-from-an-enterprise)
        public var delete: Request<Void> {
            Request(path: path, method: "DELETE", id: "enterprise-admin/delete-self-hosted-runner-from-enterprise")
        }
    }
}
