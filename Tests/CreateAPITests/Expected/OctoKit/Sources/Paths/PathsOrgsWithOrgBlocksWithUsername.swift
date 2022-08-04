// Generated by Create API
// https://github.com/CreateAPI/CreateAPI
//
// swiftlint:disable all

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.Orgs.WithOrg.Blocks {
    public func username(_ username: String) -> WithUsername {
        WithUsername(path: "\(path)/\(username)")
    }

    public struct WithUsername {
        /// Path: `/orgs/{org}/blocks/{username}`
        public let path: String

        /// Check if a user is blocked by an organization
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/orgs#check-if-a-user-is-blocked-by-an-organization)
        public var get: Request<Void> {
            Request(method: "GET", url: path, id: "orgs/check-blocked-user")
        }

        /// Block a user from an organization
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/orgs#block-a-user-from-an-organization)
        public var put: Request<Void> {
            Request(method: "PUT", url: path, id: "orgs/block-user")
        }

        /// Unblock a user from an organization
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/orgs#unblock-a-user-from-an-organization)
        public var delete: Request<Void> {
            Request(method: "DELETE", url: path, id: "orgs/unblock-user")
        }
    }
}
