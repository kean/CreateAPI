// Generated by Create API
// https://github.com/CreateAPI/CreateAPI
//
// swiftlint:disable all

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.User.Codespaces {
    public var secrets: Secrets {
        Secrets(path: path + "/secrets")
    }

    public struct Secrets {
        /// Path: `/user/codespaces/secrets`
        public let path: String

        /// List secrets for the authenticated user
        ///
        /// Lists all secrets available for a user's Codespaces without revealing their
        /// encrypted values.
        /// You must authenticate using an access token with the `user` or `read:user` scope to use this endpoint. User must have Codespaces access to use this endpoint.
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/codespaces#list-secrets-for-the-authenticated-user)
        public func get(perPage: Int? = nil, page: Int? = nil) -> Request<GetResponse> {
            Request(method: "GET", url: path, query: makeGetQuery(perPage, page), id: "codespaces/list-secrets-for-authenticated-user")
        }

        public struct GetResponse: Decodable {
            public var totalCount: Int
            public var secrets: [OctoKit.CodespacesSecret]

            public init(totalCount: Int, secrets: [OctoKit.CodespacesSecret]) {
                self.totalCount = totalCount
                self.secrets = secrets
            }

            private enum CodingKeys: String, CodingKey {
                case totalCount = "total_count"
                case secrets
            }
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
    }
}
