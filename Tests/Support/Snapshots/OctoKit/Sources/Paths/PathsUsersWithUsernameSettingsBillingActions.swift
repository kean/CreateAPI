// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.Users.WithUsername.Settings.Billing {
    public var actions: Actions {
        Actions(path: path + "/actions")
    }

    public struct Actions {
        /// Path: `/users/{username}/settings/billing/actions`
        public let path: String

        /// Get GitHub Actions billing for a user
        ///
        /// Gets the summary of the free and paid GitHub Actions minutes used.
        /// 
        /// Paid minutes only apply to workflows in private repositories that use GitHub-hosted runners. Minutes used is listed for each GitHub-hosted runner operating system. Any job re-runs are also included in the usage. The usage returned includes any minute multipliers for macOS and Windows runners, and is rounded up to the nearest whole minute. For more information, see "[Managing billing for GitHub Actions](https://help.github.com/github/setting-up-and-managing-billing-and-payments-on-github/managing-billing-for-github-actions)".
        /// 
        /// Access tokens must have the `user` scope.
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/billing#get-github-actions-billing-for-a-user)
        public var get: Request<OctoKit.ActionsBillingUsage> {
            Request(path: path, method: "GET", id: "billing/get-github-actions-billing-user")
        }
    }
}
