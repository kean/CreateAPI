// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.Repos.WithOwner.WithRepo {
    public var dispatches: Dispatches {
        Dispatches(path: path + "/dispatches")
    }

    public struct Dispatches {
        /// Path: `/repos/{owner}/{repo}/dispatches`
        public let path: String

        /// Create a repository dispatch event
        ///
        /// You can use this endpoint to trigger a webhook event called `repository_dispatch` when you want activity that happens outside of GitHub to trigger a GitHub Actions workflow or GitHub App webhook. You must configure your GitHub Actions workflow or GitHub App to run when the `repository_dispatch` event occurs. For an example `repository_dispatch` webhook payload, see "[RepositoryDispatchEvent](https://docs.github.com/webhooks/event-payloads/#repository_dispatch)."
        /// 
        /// The `client_payload` parameter is available for any extra information that your workflow might need. This parameter is a JSON payload that will be passed on when the webhook event is dispatched. For example, the `client_payload` can include a message that a user would like to send using a GitHub Actions workflow. Or the `client_payload` can be used as a test to debug your workflow.
        /// 
        /// This endpoint requires write access to the repository by providing either:
        /// 
        ///   - Personal access tokens with `repo` scope. For more information, see "[Creating a personal access token for the command line](https://help.github.com/articles/creating-a-personal-access-token-for-the-command-line)" in the GitHub Help documentation.
        ///   - GitHub Apps with both `metadata:read` and `contents:read&write` permissions.
        /// 
        /// This input example shows how you can use the `client_payload` as a test to debug your workflow.
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/repos#create-a-repository-dispatch-event)
        public func post(_ body: PostRequest) -> Request<Void> {
            Request(path: path, method: "POST", body: body, id: "repos/create-dispatch-event")
        }

        public struct PostRequest: Encodable {
            /// A custom webhook event name.
            public var eventType: String
            /// JSON payload with extra information about the webhook event that your action or worklow may use.
            public var clientPayload: [String: AnyJSON]?

            public init(eventType: String, clientPayload: [String: AnyJSON]? = nil) {
                self.eventType = eventType
                self.clientPayload = clientPayload
            }

            public func encode(to encoder: Encoder) throws {
                var values = encoder.container(keyedBy: StringCodingKey.self)
                try values.encode(eventType, forKey: "event_type")
                try values.encodeIfPresent(clientPayload, forKey: "client_payload")
            }
        }
    }
}
