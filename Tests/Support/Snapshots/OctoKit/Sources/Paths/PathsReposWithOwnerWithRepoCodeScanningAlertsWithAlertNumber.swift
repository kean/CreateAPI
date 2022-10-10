// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.Repos.WithOwner.WithRepo.CodeScanning.Alerts {
    public func alertNumber(_ alertNumber: Int) -> WithAlertNumber {
        WithAlertNumber(path: "\(path)/\(alertNumber)")
    }

    public struct WithAlertNumber {
        /// Path: `/repos/{owner}/{repo}/code-scanning/alerts/{alert_number}`
        public let path: String

        /// Get a code scanning alert
        ///
        /// Gets a single code scanning alert. You must use an access token with the `security_events` scope to use this endpoint with private repos, the `public_repo` scope also grants permission to read security events on public repos only. GitHub Apps must have the `security_events` read permission to use this endpoint.
        /// 
        /// **Deprecation notice**:
        /// The instances field is deprecated and will, in future, not be included in the response for this endpoint. The example response reflects this change. The same information can now be retrieved via a GET request to the URL specified by `instances_url`.
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/code-scanning#get-a-code-scanning-alert)
        public var get: Request<OctoKit.CodeScanningAlert> {
            Request(path: path, method: "GET", id: "code-scanning/get-alert")
        }

        /// Update a code scanning alert
        ///
        /// Updates the status of a single code scanning alert. You must use an access token with the `security_events` scope to use this endpoint with private repositories. You can also use tokens with the `public_repo` scope for public repositories only. GitHub Apps must have the `security_events` write permission to use this endpoint.
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/code-scanning#update-a-code-scanning-alert)
        public func patch(_ body: PatchRequest) -> Request<OctoKit.CodeScanningAlert> {
            Request(path: path, method: "PATCH", body: body, id: "code-scanning/update-alert")
        }

        public struct PatchRequest: Encodable {
            /// Sets the state of the code scanning alert. Can be one of `open` or `dismissed`. You must provide `dismissed_reason` when you set the state to `dismissed`.
            public var state: OctoKit.CodeScanningAlertSetState
            /// **Required when the state is dismissed.** The reason for dismissing or closing the alert. Can be one of: `false positive`, `won't fix`, and `used in tests`.
            public var dismissedReason: OctoKit.CodeScanningAlertDismissedReason?

            public init(state: OctoKit.CodeScanningAlertSetState, dismissedReason: OctoKit.CodeScanningAlertDismissedReason? = nil) {
                self.state = state
                self.dismissedReason = dismissedReason
            }

            public func encode(to encoder: Encoder) throws {
                var values = encoder.container(keyedBy: StringCodingKey.self)
                try values.encode(state, forKey: "state")
                try values.encodeIfPresent(dismissedReason, forKey: "dismissed_reason")
            }
        }
    }
}
