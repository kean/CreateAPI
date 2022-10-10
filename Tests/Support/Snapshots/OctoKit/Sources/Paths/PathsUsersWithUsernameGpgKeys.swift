// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.Users.WithUsername {
    public var gpgKeys: GpgKeys {
        GpgKeys(path: path + "/gpg_keys")
    }

    public struct GpgKeys {
        /// Path: `/users/{username}/gpg_keys`
        public let path: String

        /// List GPG keys for a user
        ///
        /// Lists the GPG keys for a user. This information is accessible by anyone.
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/users#list-gpg-keys-for-a-user)
        public func get(perPage: Int? = nil, page: Int? = nil) -> Request<[OctoKit.GpgKey]> {
            Request(path: path, method: "GET", query: makeGetQuery(perPage, page), id: "users/list-gpg-keys-for-user")
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
