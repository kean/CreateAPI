// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.Enterprises.WithEnterprise.Settings.Billing {
    public var sharedStorage: SharedStorage {
        SharedStorage(path: path + "/shared-storage")
    }

    public struct SharedStorage {
        /// Path: `/enterprises/{enterprise}/settings/billing/shared-storage`
        public let path: String

        /// Get shared storage billing for an enterprise
        ///
        /// Gets the estimated paid and estimated total storage used for GitHub Actions and Github Packages.
        /// 
        /// Paid minutes only apply to packages stored for private repositories. For more information, see "[Managing billing for GitHub Packages](https://help.github.com/github/setting-up-and-managing-billing-and-payments-on-github/managing-billing-for-github-packages)."
        /// 
        /// The authenticated user must be an enterprise admin.
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/billing#get-shared-storage-billing-for-an-enterprise)
        public var get: Request<OctoKit.CombinedBillingUsage> {
            Request(path: path, method: "GET", id: "billing/get-shared-storage-billing-ghe")
        }
    }
}
