// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.Scim.V2.Enterprises.WithEnterprise {
    public var users: Users {
        Users(path: path + "/Users")
    }

    public struct Users {
        /// Path: `/scim/v2/enterprises/{enterprise}/Users`
        public let path: String

        /// List SCIM provisioned identities for an enterprise
        ///
        /// **Note:** The SCIM API endpoints for enterprise accounts are currently in beta and are subject to change.
        /// 
        /// Retrieves a paginated list of all provisioned enterprise members, including pending invitations.
        /// 
        /// When a user with a SAML-provisioned external identity leaves (or is removed from) an enterprise, the account's metadata is immediately removed. However, the returned list of user accounts might not always match the organization or enterprise member list you see on GitHub. This can happen in certain cases where an external identity associated with an organization will not match an organization member:
        ///   - When a user with a SCIM-provisioned external identity is removed from an enterprise, the account's metadata is preserved to allow the user to re-join the organization in the future.
        ///   - When inviting a user to join an organization, you can expect to see their external identity in the results before they accept the invitation, or if the invitation is cancelled (or never accepted).
        ///   - When a user is invited over SCIM, an external identity is created that matches with the invitee's email address. However, this identity is only linked to a user account when the user accepts the invitation by going through SAML SSO.
        /// 
        /// The returned list of external identities can include an entry for a `null` user. These are unlinked SAML identities that are created when a user goes through the following Single Sign-On (SSO) process but does not sign in to their GitHub account after completing SSO:
        /// 
        /// 1. The user is granted access by the IdP and is not a member of the GitHub enterprise.
        /// 
        /// 1. The user attempts to access the GitHub enterprise and initiates the SAML SSO process, and is not currently signed in to their GitHub account.
        /// 
        /// 1. After successfully authenticating with the SAML SSO IdP, the `null` external identity entry is created and the user is prompted to sign in to their GitHub account:
        ///    - If the user signs in, their GitHub account is linked to this entry.
        ///    - If the user does not sign in (or does not create a new account when prompted), they are not added to the GitHub enterprise, and the external identity `null` entry remains in place.
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/enterprise-admin#list-scim-provisioned-identities-for-an-enterprise)
        public func get(parameters: GetParameters? = nil) -> Request<OctoKit.ScimUserListEnterprise> {
            Request(path: path, method: "GET", query: parameters?.asQuery, id: "enterprise-admin/list-provisioned-identities-enterprise")
        }

        public struct GetParameters {
            public var startIndex: Int?
            public var count: Int?
            public var filter: String?

            public init(startIndex: Int? = nil, count: Int? = nil, filter: String? = nil) {
                self.startIndex = startIndex
                self.count = count
                self.filter = filter
            }

            public var asQuery: [(String, String?)] {
                let encoder = URLQueryEncoder()
                encoder.encode(startIndex, forKey: "startIndex")
                encoder.encode(count, forKey: "count")
                encoder.encode(filter, forKey: "filter")
                return encoder.items
            }
        }

        /// Provision and invite a SCIM enterprise user
        ///
        /// **Note:** The SCIM API endpoints for enterprise accounts are currently in beta and are subject to change.
        /// 
        /// Provision enterprise membership for a user, and send organization invitation emails to the email address.
        /// 
        /// You can optionally include the groups a user will be invited to join. If you do not provide a list of `groups`, the user is provisioned for the enterprise, but no organization invitation emails will be sent.
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/enterprise-admin#provision-and-invite-a-scim-enterprise-user)
        public func post(_ body: PostRequest) -> Request<OctoKit.ScimEnterpriseUser> {
            Request(path: path, method: "POST", body: body, id: "enterprise-admin/provision-and-invite-enterprise-user")
        }

        public struct PostRequest: Encodable {
            /// The SCIM schema URIs.
            public var schemas: [String]
            /// The username for the user.
            public var userName: String
            public var name: Name
            /// List of user emails.
            public var emails: [Email]
            /// List of SCIM group IDs the user is a member of.
            public var groups: [Group]?

            public struct Name: Encodable {
                /// The first name of the user.
                public var givenName: String
                /// The last name of the user.
                public var familyName: String

                public init(givenName: String, familyName: String) {
                    self.givenName = givenName
                    self.familyName = familyName
                }

                public func encode(to encoder: Encoder) throws {
                    var values = encoder.container(keyedBy: StringCodingKey.self)
                    try values.encode(givenName, forKey: "givenName")
                    try values.encode(familyName, forKey: "familyName")
                }
            }

            public struct Email: Encodable {
                /// The email address.
                public var value: String
                /// The type of email address.
                public var type: String
                /// Whether this email address is the primary address.
                public var isPrimary: Bool

                public init(value: String, type: String, isPrimary: Bool) {
                    self.value = value
                    self.type = type
                    self.isPrimary = isPrimary
                }

                public func encode(to encoder: Encoder) throws {
                    var values = encoder.container(keyedBy: StringCodingKey.self)
                    try values.encode(value, forKey: "value")
                    try values.encode(type, forKey: "type")
                    try values.encode(isPrimary, forKey: "primary")
                }
            }

            public struct Group: Encodable {
                public var value: String?

                public init(value: String? = nil) {
                    self.value = value
                }

                public func encode(to encoder: Encoder) throws {
                    var values = encoder.container(keyedBy: StringCodingKey.self)
                    try values.encodeIfPresent(value, forKey: "value")
                }
            }

            public init(schemas: [String], userName: String, name: Name, emails: [Email], groups: [Group]? = nil) {
                self.schemas = schemas
                self.userName = userName
                self.name = name
                self.emails = emails
                self.groups = groups
            }

            public func encode(to encoder: Encoder) throws {
                var values = encoder.container(keyedBy: StringCodingKey.self)
                try values.encode(schemas, forKey: "schemas")
                try values.encode(userName, forKey: "userName")
                try values.encode(name, forKey: "name")
                try values.encode(emails, forKey: "emails")
                try values.encodeIfPresent(groups, forKey: "groups")
            }
        }
    }
}
