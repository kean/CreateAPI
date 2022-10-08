// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.Orgs.WithOrg.PublicMembers {
    public func username(_ username: String) -> WithUsername {
        WithUsername(path: "\(path)/\(username)")
    }

    public struct WithUsername {
        /// Path: `/orgs/{org}/public_members/{username}`
        public let path: String

        /// Check public organization membership for a user
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/orgs#check-public-organization-membership-for-a-user)
        public var get: Request<Void> {
            Request(path: path, method: "GET", id: "orgs/check-public-membership-for-user")
        }

        /// Set public organization membership for the authenticated user
        ///
        /// The user can publicize their own membership. (A user cannot publicize the membership for another user.)
        /// 
        /// Note that you'll need to set `Content-Length` to zero when calling out to this endpoint. For more information, see "[HTTP verbs](https://docs.github.com/rest/overview/resources-in-the-rest-api#http-verbs)."
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/orgs#set-public-organization-membership-for-the-authenticated-user)
        public var put: Request<Void> {
            Request(path: path, method: "PUT", id: "orgs/set-public-membership-for-authenticated-user")
        }

        /// Remove public organization membership for the authenticated user
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/orgs#remove-public-organization-membership-for-the-authenticated-user)
        public var delete: Request<Void> {
            Request(path: path, method: "DELETE", id: "orgs/remove-public-membership-for-authenticated-user")
        }
    }
}
