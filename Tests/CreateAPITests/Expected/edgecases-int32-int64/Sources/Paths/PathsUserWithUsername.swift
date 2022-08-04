// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import NaiveDate
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.User {
    public func username(_ username: String) -> WithUsername {
        WithUsername(path: "\(path)/\(username)")
    }

    public struct WithUsername {
        /// Path: `/user/{username}`
        public let path: String

        /// Get user by user name
        public var get: Request<edgecases_int32_int64.User> {
            Request(method: "GET", url: path, id: "getUserByName")
        }

        /// Updated user
        ///
        /// This can only be done by the logged in user.
        public func put(_ body: edgecases_int32_int64.User) -> Request<Void> {
            Request(method: "PUT", url: path, body: body, id: "updateUser")
        }

        /// Delete user
        ///
        /// This can only be done by the logged in user.
        public var delete: Request<Void> {
            Request(method: "DELETE", url: path, id: "deleteUser")
        }
    }
}
