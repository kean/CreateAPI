// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.User.Memberships.Orgs {
    public func org(_ org: String) -> WithOrg {
        WithOrg(path: "\(path)/\(org)")
    }

    public struct WithOrg {
        /// Path: `/user/memberships/orgs/{org}`
        public let path: String

        /// Get an organization membership for the authenticated user
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/orgs#get-an-organization-membership-for-the-authenticated-user)
        public var get: Request<OctoKit.OrgMembership> {
            Request(path: path, method: "GET", id: "orgs/get-membership-for-authenticated-user")
        }

        /// Update an organization membership for the authenticated user
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/orgs#update-an-organization-membership-for-the-authenticated-user)
        public func patch(state: PatchRequest.State) -> Request<OctoKit.OrgMembership> {
            Request(path: path, method: "PATCH", body: PatchRequest(state: state), id: "orgs/update-membership-for-authenticated-user")
        }

        public struct PatchRequest: Encodable {
            /// The state that the membership should be in. Only `"active"` will be accepted.
            public var state: State

            /// The state that the membership should be in. Only `"active"` will be accepted.
            public enum State: String, CaseIterable, Codable {
                case active
            }

            public init(state: State = .active) {
                self.state = state
            }

            public func encode(to encoder: Encoder) throws {
                var values = encoder.container(keyedBy: StringCodingKey.self)
                try values.encode(state, forKey: "state")
            }
        }
    }
}
