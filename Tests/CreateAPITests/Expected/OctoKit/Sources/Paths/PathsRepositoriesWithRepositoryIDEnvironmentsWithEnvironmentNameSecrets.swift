// Generated by Create API
// https://github.com/CreateAPI/CreateAPI
//
// swiftlint:disable all

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.Repositories.WithRepositoryID.Environments.WithEnvironmentName {
    public var secrets: Secrets {
        Secrets(path: path + "/secrets")
    }

    public struct Secrets {
        /// Path: `/repositories/{repository_id}/environments/{environment_name}/secrets`
        public let path: String

        /// List environment secrets
        ///
        /// Lists all secrets available in an environment without revealing their encrypted values. You must authenticate using an access token with the `repo` scope to use this endpoint. GitHub Apps must have the `secrets` repository permission to use this endpoint.
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/actions#list-environment-secrets)
        public func get(perPage: Int? = nil, page: Int? = nil) -> Request<GetResponse> {
            Request(method: "GET", url: path, query: makeGetQuery(perPage, page), id: "actions/list-environment-secrets")
        }

        public struct GetResponse: Decodable {
            public var totalCount: Int
            public var secrets: [OctoKit.ActionsSecret]

            public init(totalCount: Int, secrets: [OctoKit.ActionsSecret]) {
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
