// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.App.Hook {
    public var config: Config {
        Config(path: path + "/config")
    }

    public struct Config {
        /// Path: `/app/hook/config`
        public let path: String

        /// Get a webhook configuration for an app
        ///
        /// Returns the webhook configuration for a GitHub App. For more information about configuring a webhook for your app, see "[Creating a GitHub App](/developers/apps/creating-a-github-app)."
        /// 
        /// You must use a [JWT](https://docs.github.com/apps/building-github-apps/authenticating-with-github-apps/#authenticating-as-a-github-app) to access this endpoint.
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/apps#get-a-webhook-configuration-for-an-app)
        public var get: Request<OctoKit.WebhookConfig> {
            Request(path: path, method: "GET", id: "apps/get-webhook-config-for-app")
        }

        /// Update a webhook configuration for an app
        ///
        /// Updates the webhook configuration for a GitHub App. For more information about configuring a webhook for your app, see "[Creating a GitHub App](/developers/apps/creating-a-github-app)."
        /// 
        /// You must use a [JWT](https://docs.github.com/apps/building-github-apps/authenticating-with-github-apps/#authenticating-as-a-github-app) to access this endpoint.
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/apps#update-a-webhook-configuration-for-an-app)
        public func patch(_ body: PatchRequest? = nil) -> Request<OctoKit.WebhookConfig> {
            Request(path: path, method: "PATCH", body: body, id: "apps/update-webhook-config-for-app")
        }

        /// Example:
        ///
        /// {
        ///   "content_type" : "json",
        ///   "insecure_ssl" : "0",
        ///   "secret" : "********",
        ///   "url" : "https:\/\/example.com\/webhook"
        /// }
        public struct PatchRequest: Encodable {
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

            public init(url: URL? = nil, contentType: String? = nil, secret: String? = nil, insecureSSL: OctoKit.WebhookConfigInsecureSSL? = nil) {
                self.url = url
                self.contentType = contentType
                self.secret = secret
                self.insecureSSL = insecureSSL
            }

            public func encode(to encoder: Encoder) throws {
                var values = encoder.container(keyedBy: StringCodingKey.self)
                try values.encodeIfPresent(url, forKey: "url")
                try values.encodeIfPresent(contentType, forKey: "content_type")
                try values.encodeIfPresent(secret, forKey: "secret")
                try values.encodeIfPresent(insecureSSL, forKey: "insecure_ssl")
            }
        }
    }
}
