// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.Repos.WithOwner.WithRepo {
    public var subscription: Subscription {
        Subscription(path: path + "/subscription")
    }

    public struct Subscription {
        /// Path: `/repos/{owner}/{repo}/subscription`
        public let path: String

        /// Get a repository subscription
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/activity#get-a-repository-subscription)
        public var get: Request<OctoKit.RepositorySubscription> {
            Request(path: path, method: "GET", id: "activity/get-repo-subscription")
        }

        /// Set a repository subscription
        ///
        /// If you would like to watch a repository, set `subscribed` to `true`. If you would like to ignore notifications made within a repository, set `ignored` to `true`. If you would like to stop watching a repository, [delete the repository's subscription](https://docs.github.com/rest/reference/activity#delete-a-repository-subscription) completely.
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/activity#set-a-repository-subscription)
        public func put(_ body: PutRequest? = nil) -> Request<OctoKit.RepositorySubscription> {
            Request(path: path, method: "PUT", body: body, id: "activity/set-repo-subscription")
        }

        public struct PutRequest: Encodable {
            /// Determines if notifications should be received from this repository.
            public var isSubscribed: Bool?
            /// Determines if all notifications should be blocked from this repository.
            public var isIgnored: Bool?

            public init(isSubscribed: Bool? = nil, isIgnored: Bool? = nil) {
                self.isSubscribed = isSubscribed
                self.isIgnored = isIgnored
            }

            public func encode(to encoder: Encoder) throws {
                var values = encoder.container(keyedBy: StringCodingKey.self)
                try values.encodeIfPresent(isSubscribed, forKey: "subscribed")
                try values.encodeIfPresent(isIgnored, forKey: "ignored")
            }
        }

        /// Delete a repository subscription
        ///
        /// This endpoint should only be used to stop watching a repository. To control whether or not you wish to receive notifications from a repository, [set the repository's subscription manually](https://docs.github.com/rest/reference/activity#set-a-repository-subscription).
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/activity#delete-a-repository-subscription)
        public var delete: Request<Void> {
            Request(path: path, method: "DELETE", id: "activity/delete-repo-subscription")
        }
    }
}
