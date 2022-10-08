// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.Orgs.WithOrg {
    public var invitations: Invitations {
        Invitations(path: path + "/invitations")
    }

    public struct Invitations {
        /// Path: `/orgs/{org}/invitations`
        public let path: String

        /// List pending organization invitations
        ///
        /// The return hash contains a `role` field which refers to the Organization Invitation role and will be one of the following values: `direct_member`, `admin`, `billing_manager`, `hiring_manager`, or `reinstate`. If the invitee is not a GitHub member, the `login` field in the return hash will be `null`.
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/orgs#list-pending-organization-invitations)
        public func get(perPage: Int? = nil, page: Int? = nil) -> Request<[OctoKit.OrganizationInvitation]> {
            Request(path: path, method: "GET", query: makeGetQuery(perPage, page), id: "orgs/list-pending-invitations")
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

        /// Create an organization invitation
        ///
        /// Invite people to an organization by using their GitHub user ID or their email address. In order to create invitations in an organization, the authenticated user must be an organization owner.
        /// 
        /// This endpoint triggers [notifications](https://docs.github.com/en/github/managing-subscriptions-and-notifications-on-github/about-notifications). Creating content too quickly using this endpoint may result in secondary rate limiting. See "[Secondary rate limits](https://docs.github.com/rest/overview/resources-in-the-rest-api#secondary-rate-limits)" and "[Dealing with secondary rate limits](https://docs.github.com/rest/guides/best-practices-for-integrators#dealing-with-secondary-rate-limits)" for details.
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/orgs#create-an-organization-invitation)
        public func post(_ body: PostRequest? = nil) -> Request<OctoKit.OrganizationInvitation> {
            Request(path: path, method: "POST", body: body, id: "orgs/create-invitation")
        }

        public struct PostRequest: Encodable {
            /// **Required unless you provide `email`**. GitHub user ID for the person you are inviting.
            public var inviteeID: Int?
            /// **Required unless you provide `invitee_id`**. Email address of the person you are inviting, which can be an existing GitHub user.
            public var email: String?
            /// Specify role for new member. Can be one of:  
            /// \* `admin` - Organization owners with full administrative rights to the organization and complete access to all repositories and teams.  
            /// \* `direct_member` - Non-owner organization members with ability to see other members and join teams by invitation.  
            /// \* `billing_manager` - Non-owner organization members with ability to manage the billing settings of your organization.
            public var role: Role?
            /// Specify IDs for the teams you want to invite new members to.
            public var teamIDs: [Int]?

            /// Specify role for new member. Can be one of:  
            /// \* `admin` - Organization owners with full administrative rights to the organization and complete access to all repositories and teams.  
            /// \* `direct_member` - Non-owner organization members with ability to see other members and join teams by invitation.  
            /// \* `billing_manager` - Non-owner organization members with ability to manage the billing settings of your organization.
            public enum Role: String, Codable, CaseIterable {
                case admin
                case directMember = "direct_member"
                case billingManager = "billing_manager"
            }

            public init(inviteeID: Int? = nil, email: String? = nil, role: Role? = nil, teamIDs: [Int]? = nil) {
                self.inviteeID = inviteeID
                self.email = email
                self.role = role
                self.teamIDs = teamIDs
            }

            public func encode(to encoder: Encoder) throws {
                var values = encoder.container(keyedBy: StringCodingKey.self)
                try values.encodeIfPresent(inviteeID, forKey: "invitee_id")
                try values.encodeIfPresent(email, forKey: "email")
                try values.encodeIfPresent(role, forKey: "role")
                try values.encodeIfPresent(teamIDs, forKey: "team_ids")
            }
        }
    }
}
