// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.Repos.WithOwner.WithRepo {
    public var hooks: Hooks {
        Hooks(path: path + "/hooks")
    }

    public struct Hooks {
        /// Path: `/repos/{owner}/{repo}/hooks`
        public let path: String

        /// List repository webhooks
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/repos#list-repository-webhooks)
        public func get(perPage: Int? = nil, page: Int? = nil) -> Request<[OctoKit.Hook]> {
            Request(method: "GET", url: path, query: makeGetQuery(perPage, page), id: "repos/list-webhooks")
        }

        public enum GetResponseHeaders {
            public static let link = HTTPHeader<String>(field: "Link")
        }

        private func makeGetQuery(_ perPage: Int?, _ page: Int?) -> [(String, String?)] {
            let encoder = URLQueryEncoder()
            encoder.encode(perPage, forKey: "per_page")
            encoder.encode(page, forKey: "page")
            return encoder.items
        }

        /// Create a repository webhook
        ///
        /// Repositories can have multiple webhooks installed. Each webhook should have a unique `config`. Multiple webhooks can
        /// share the same `config` as long as those webhooks do not have any `events` that overlap.
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/repos#create-a-repository-webhook)
        public func post(_ body: PostRequest? = nil) -> Request<OctoKit.Hook> {
            Request(method: "POST", url: path, body: body, id: "repos/create-webhook")
        }

        public enum PostResponseHeaders {
            public static let location = HTTPHeader<String>(field: "Location")
        }

        public struct PostRequest: Encodable {
            /// Use `web` to create a webhook. Default: `web`. This parameter only accepts the value `web`.
            public var name: String?
            /// Key/value pairs to provide settings for this webhook. [These are defined below](https://docs.github.com/rest/reference/repos#create-hook-config-params).
            public var config: Config?
            /// Determines what [events](https://docs.github.com/webhooks/event-payloads) the hook is triggered for.
            public var events: [String]?
            /// Determines if notifications are sent when the webhook is triggered. Set to `true` to send notifications.
            public var isActive: Bool

            /// Key/value pairs to provide settings for this webhook. [These are defined below](https://docs.github.com/rest/reference/repos#create-hook-config-params).
            public struct Config: Encodable {
                /// The URL to which the payloads will be delivered.
                ///
                /// Example: "https://example.com/webhook"
                public var url: URL?
                /// The media type used to serialize the payloads. Supported values include `json` and `form`. The default is `form`.
                ///
                /// Example: "json"
                public var contentType: String?
                /// If provided, the `secret` will be used as the `key` to generate the HMAC hex digest value for [delivery signature headers](https://docs.github.com/webhooks/event-payloads/#delivery-headers).
                ///
                /// Example: "********"
                public var secret: String?
                public var insecureSSL: OctoKit.WebhookConfigInsecureSSL?
                /// Example: "abc"
                public var token: String?
                /// Example: "sha256"
                public var digest: String?

                public init(url: URL? = nil, contentType: String? = nil, secret: String? = nil, insecureSSL: OctoKit.WebhookConfigInsecureSSL? = nil, token: String? = nil, digest: String? = nil) {
                    self.url = url
                    self.contentType = contentType
                    self.secret = secret
                    self.insecureSSL = insecureSSL
                    self.token = token
                    self.digest = digest
                }

                public func encode(to encoder: Encoder) throws {
                    var values = encoder.container(keyedBy: StringCodingKey.self)
                    try values.encodeIfPresent(url, forKey: "url")
                    try values.encodeIfPresent(contentType, forKey: "content_type")
                    try values.encodeIfPresent(secret, forKey: "secret")
                    try values.encodeIfPresent(insecureSSL, forKey: "insecure_ssl")
                    try values.encodeIfPresent(token, forKey: "token")
                    try values.encodeIfPresent(digest, forKey: "digest")
                }
            }

            public init(name: String? = nil, config: Config? = nil, events: [String]? = nil, isActive: Bool? = nil) {
                self.name = name
                self.config = config
                self.events = events
                self.isActive = isActive ?? true
            }

            public func encode(to encoder: Encoder) throws {
                var values = encoder.container(keyedBy: StringCodingKey.self)
                try values.encodeIfPresent(name, forKey: "name")
                try values.encodeIfPresent(config, forKey: "config")
                try values.encodeIfPresent(events, forKey: "events")
                try values.encodeIfPresent(isActive, forKey: "active")
            }
        }
    }
}
