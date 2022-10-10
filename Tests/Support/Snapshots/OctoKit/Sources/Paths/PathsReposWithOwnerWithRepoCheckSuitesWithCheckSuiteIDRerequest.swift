// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.Repos.WithOwner.WithRepo.CheckSuites.WithCheckSuiteID {
    public var rerequest: Rerequest {
        Rerequest(path: path + "/rerequest")
    }

    public struct Rerequest {
        /// Path: `/repos/{owner}/{repo}/check-suites/{check_suite_id}/rerequest`
        public let path: String

        /// Rerequest a check suite
        ///
        /// Triggers GitHub to rerequest an existing check suite, without pushing new code to a repository. This endpoint will trigger the [`check_suite` webhook](https://docs.github.com/webhooks/event-payloads/#check_suite) event with the action `rerequested`. When a check suite is `rerequested`, its `status` is reset to `queued` and the `conclusion` is cleared.
        /// 
        /// To rerequest a check suite, your GitHub App must have the `checks:read` permission on a private repository or pull access to a public repository.
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/checks#rerequest-a-check-suite)
        public var post: Request<Void> {
            Request(path: path, method: "POST", id: "checks/rerequest-suite")
        }
    }
}
