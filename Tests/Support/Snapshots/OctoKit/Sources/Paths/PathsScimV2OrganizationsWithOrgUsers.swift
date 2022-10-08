// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.Scim.V2.Organizations.WithOrg {
    public var users: Users {
        Users(path: path + "/Users")
    }

    public struct Users {
        /// Path: `/scim/v2/organizations/{org}/Users`
        public let path: String

        /// List SCIM provisioned identities
        ///
        /// Retrieves a paginated list of all provisioned organization members, including pending invitations. If you provide the `filter` parameter, the resources for all matching provisions members are returned.
        /// 
        /// When a user with a SAML-provisioned external identity leaves (or is removed from) an organization, the account's metadata is immediately removed. However, the returned list of user accounts might not always match the organization or enterprise member list you see on GitHub. This can happen in certain cases where an external identity associated with an organization will not match an organization member:
        ///   - When a user with a SCIM-provisioned external identity is removed from an organization, the account's metadata is preserved to allow the user to re-join the organization in the future.
        ///   - When inviting a user to join an organization, you can expect to see their external identity in the results before they accept the invitation, or if the invitation is cancelled (or never accepted).
        ///   - When a user is invited over SCIM, an external identity is created that matches with the invitee's email address. However, this identity is only linked to a user account when the user accepts the invitation by going through SAML SSO.
        /// 
        /// The returned list of external identities can include an entry for a `null` user. These are unlinked SAML identities that are created when a user goes through the following Single Sign-On (SSO) process but does not sign in to their GitHub account after completing SSO:
        /// 
        /// 1. The user is granted access by the IdP and is not a member of the GitHub organization.
        /// 
        /// 1. The user attempts to access the GitHub organization and initiates the SAML SSO process, and is not currently signed in to their GitHub account.
        /// 
        /// 1. After successfully authenticating with the SAML SSO IdP, the `null` external identity entry is created and the user is prompted to sign in to their GitHub account:
        ///    - If the user signs in, their GitHub account is linked to this entry.
        ///    - If the user does not sign in (or does not create a new account when prompted), they are not added to the GitHub organization, and the external identity `null` entry remains in place.
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/scim#list-scim-provisioned-identities)
        public func get(parameters: GetParameters? = nil) -> Request<OctoKit.ScimUserList> {
            Request(path: path, method: "GET", query: parameters?.asQuery, id: "scim/list-provisioned-identities")
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

        /// Provision and invite a SCIM user
        ///
        /// Provision organization membership for a user, and send an activation email to the email address.
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/scim#provision-and-invite-a-scim-user)
        public func post(_ body: PostRequest) -> Request<OctoKit.ScimUser> {
            Request(path: path, method: "POST", body: body, id: "scim/provision-and-invite-user")
        }

        public struct PostRequest: Encodable {
            /// Configured by the admin. Could be an email, login, or username
            ///
            /// Example: "someone@example.com"
            public var userName: String
            /// The name of the user, suitable for display to end-users
            ///
            /// Example: "Jon Doe"
            public var displayName: String?
            /// Example:
            ///
            /// {
            ///   "familyName" : "User",
            ///   "givenName" : "Jane"
            /// }
            public var name: Name
            /// User emails
            ///
            /// Example:
            ///
            /// [
            ///   {
            ///     "primary" : true,
            ///     "value" : "someone@example.com"
            ///   },
            ///   {
            ///     "primary" : false,
            ///     "value" : "another@example.com"
            ///   }
            /// ]
            public var emails: [Email]
            public var schemas: [String]?
            public var externalID: String?
            public var groups: [String]?
            public var isActive: Bool?

            /// Example:
            ///
            /// {
            ///   "familyName" : "User",
            ///   "givenName" : "Jane"
            /// }
            public struct Name: Encodable {
                public var givenName: String
                public var familyName: String
                public var formatted: String?

                public init(givenName: String, familyName: String, formatted: String? = nil) {
                    self.givenName = givenName
                    self.familyName = familyName
                    self.formatted = formatted
                }

                public func encode(to encoder: Encoder) throws {
                    var values = encoder.container(keyedBy: StringCodingKey.self)
                    try values.encode(givenName, forKey: "givenName")
                    try values.encode(familyName, forKey: "familyName")
                    try values.encodeIfPresent(formatted, forKey: "formatted")
                }
            }

            public struct Email: Encodable {
                public var value: String
                public var isPrimary: Bool?
                public var type: String?

                public init(value: String, isPrimary: Bool? = nil, type: String? = nil) {
                    self.value = value
                    self.isPrimary = isPrimary
                    self.type = type
                }

                public func encode(to encoder: Encoder) throws {
                    var values = encoder.container(keyedBy: StringCodingKey.self)
                    try values.encode(value, forKey: "value")
                    try values.encodeIfPresent(isPrimary, forKey: "primary")
                    try values.encodeIfPresent(type, forKey: "type")
                }
            }

            public init(userName: String, displayName: String? = nil, name: Name, emails: [Email], schemas: [String]? = nil, externalID: String? = nil, groups: [String]? = nil, isActive: Bool? = nil) {
                self.userName = userName
                self.displayName = displayName
                self.name = name
                self.emails = emails
                self.schemas = schemas
                self.externalID = externalID
                self.groups = groups
                self.isActive = isActive
            }

            public func encode(to encoder: Encoder) throws {
                var values = encoder.container(keyedBy: StringCodingKey.self)
                try values.encode(userName, forKey: "userName")
                try values.encodeIfPresent(displayName, forKey: "displayName")
                try values.encode(name, forKey: "name")
                try values.encode(emails, forKey: "emails")
                try values.encodeIfPresent(schemas, forKey: "schemas")
                try values.encodeIfPresent(externalID, forKey: "externalId")
                try values.encodeIfPresent(groups, forKey: "groups")
                try values.encodeIfPresent(isActive, forKey: "active")
            }
        }
    }
}
