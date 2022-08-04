// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.Orgs {
    public func org(_ org: String) -> WithOrg {
        WithOrg(path: "\(path)/\(org)")
    }

    public struct WithOrg {
        /// Path: `/orgs/{org}`
        public let path: String

        /// Get an organization
        ///
        /// To see many of the organization response values, you need to be an authenticated organization owner with the `admin:org` scope. When the value of `two_factor_requirement_enabled` is `true`, the organization requires all members, billing managers, and outside collaborators to enable [two-factor authentication](https://help.github.com/articles/securing-your-account-with-two-factor-authentication-2fa/).
        /// 
        /// GitHub Apps with the `Organization plan` permission can use this endpoint to retrieve information about an organization's GitHub plan. See "[Authenticating with GitHub Apps](https://docs.github.com/apps/building-github-apps/authenticating-with-github-apps/)" for details. For an example response, see 'Response with GitHub plan information' below."
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/orgs#get-an-organization)
        public var get: Request<OctoKit.OrganizationFull> {
            Request(method: "GET", url: path, id: "orgs/get")
        }

        /// Update an organization
        ///
        /// **Parameter Deprecation Notice:** GitHub will replace and discontinue `members_allowed_repository_creation_type` in favor of more granular permissions. The new input parameters are `members_can_create_public_repositories`, `members_can_create_private_repositories` for all organizations and `members_can_create_internal_repositories` for organizations associated with an enterprise account using GitHub Enterprise Cloud or GitHub Enterprise Server 2.20+. For more information, see the [blog post](https://developer.github.com/changes/2019-12-03-internal-visibility-changes).
        /// 
        /// Enables an authenticated organization owner with the `admin:org` scope to update the organization's profile and member privileges.
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/orgs/#update-an-organization)
        public func patch(_ body: PatchRequest? = nil) -> Request<OctoKit.OrganizationFull> {
            Request(method: "PATCH", url: path, body: body, id: "orgs/update")
        }

        public struct PatchRequest: Encodable {
            /// Billing email address. This address is not publicized.
            public var billingEmail: String?
            /// The company name.
            public var company: String?
            /// The publicly visible email address.
            public var email: String?
            /// The Twitter username of the company.
            public var twitterUsername: String?
            /// The location.
            public var location: String?
            /// The shorthand name of the company.
            public var name: String?
            /// The description of the company.
            public var description: String?
            /// Toggles whether an organization can use organization projects.
            public var hasOrganizationProjects: Bool?
            /// Toggles whether repositories that belong to the organization can use repository projects.
            public var hasRepositoryProjects: Bool?
            /// Default permission level members have for organization repositories:  
            /// \* `read` - can pull, but not push to or administer this repository.  
            /// \* `write` - can pull and push, but not administer this repository.  
            /// \* `admin` - can pull, push, and administer this repository.  
            /// \* `none` - no permissions granted by default.
            public var defaultRepositoryPermission: DefaultRepositoryPermission?
            /// Toggles the ability of non-admin organization members to create repositories. Can be one of:  
            /// \* `true` - all organization members can create repositories.  
            /// \* `false` - only organization owners can create repositories.  
            /// Default: `true`  
            /// **Note:** A parameter can override this parameter. See `members_allowed_repository_creation_type` in this table for details. **Note:** A parameter can override this parameter. See `members_allowed_repository_creation_type` in this table for details.
            public var membersCanCreateRepositories: Bool
            /// Toggles whether organization members can create internal repositories, which are visible to all enterprise members. You can only allow members to create internal repositories if your organization is associated with an enterprise account using GitHub Enterprise Cloud or GitHub Enterprise Server 2.20+. Can be one of:  
            /// \* `true` - all organization members can create internal repositories.  
            /// \* `false` - only organization owners can create internal repositories.  
            /// Default: `true`. For more information, see "[Restricting repository creation in your organization](https://help.github.com/github/setting-up-and-managing-organizations-and-teams/restricting-repository-creation-in-your-organization)" in the GitHub Help documentation.
            public var membersCanCreateInternalRepositories: Bool?
            /// Toggles whether organization members can create private repositories, which are visible to organization members with permission. Can be one of:  
            /// \* `true` - all organization members can create private repositories.  
            /// \* `false` - only organization owners can create private repositories.  
            /// Default: `true`. For more information, see "[Restricting repository creation in your organization](https://help.github.com/github/setting-up-and-managing-organizations-and-teams/restricting-repository-creation-in-your-organization)" in the GitHub Help documentation.
            public var membersCanCreatePrivateRepositories: Bool?
            /// Toggles whether organization members can create public repositories, which are visible to anyone. Can be one of:  
            /// \* `true` - all organization members can create public repositories.  
            /// \* `false` - only organization owners can create public repositories.  
            /// Default: `true`. For more information, see "[Restricting repository creation in your organization](https://help.github.com/github/setting-up-and-managing-organizations-and-teams/restricting-repository-creation-in-your-organization)" in the GitHub Help documentation.
            public var membersCanCreatePublicRepositories: Bool?
            /// Specifies which types of repositories non-admin organization members can create. Can be one of:  
            /// \* `all` - all organization members can create public and private repositories.  
            /// \* `private` - members can create private repositories. This option is only available to repositories that are part of an organization on GitHub Enterprise Cloud.  
            /// \* `none` - only admin members can create repositories.  
            /// **Note:** This parameter is deprecated and will be removed in the future. Its return value ignores internal repositories. Using this parameter overrides values set in `members_can_create_repositories`. See the parameter deprecation notice in the operation description for details.
            public var membersAllowedRepositoryCreationType: MembersAllowedRepositoryCreationType?
            /// Toggles whether organization members can create GitHub Pages sites. Can be one of:  
            /// \* `true` - all organization members can create GitHub Pages sites.  
            /// \* `false` - no organization members can create GitHub Pages sites. Existing published sites will not be impacted.
            public var membersCanCreatePages: Bool
            /// Toggles whether organization members can create public GitHub Pages sites. Can be one of:  
            /// \* `true` - all organization members can create public GitHub Pages sites.  
            /// \* `false` - no organization members can create public GitHub Pages sites. Existing published sites will not be impacted.
            public var membersCanCreatePublicPages: Bool
            /// Toggles whether organization members can create private GitHub Pages sites. Can be one of:  
            /// \* `true` - all organization members can create private GitHub Pages sites.  
            /// \* `false` - no organization members can create private GitHub Pages sites. Existing published sites will not be impacted.
            public var membersCanCreatePrivatePages: Bool
            /// Toggles whether organization members can fork private organization repositories. Can be one of:  
            /// \* `true` - all organization members can fork private repositories within the organization.  
            /// \* `false` - no organization members can fork private repositories within the organization.
            public var membersCanForkPrivateRepositories: Bool
            /// Example: "http://github.blog"
            public var blog: String?

            /// Default permission level members have for organization repositories:  
            /// \* `read` - can pull, but not push to or administer this repository.  
            /// \* `write` - can pull and push, but not administer this repository.  
            /// \* `admin` - can pull, push, and administer this repository.  
            /// \* `none` - no permissions granted by default.
            public enum DefaultRepositoryPermission: String, Codable, CaseIterable {
                case read
                case write
                case admin
                case `none`
            }

            /// Specifies which types of repositories non-admin organization members can create. Can be one of:  
            /// \* `all` - all organization members can create public and private repositories.  
            /// \* `private` - members can create private repositories. This option is only available to repositories that are part of an organization on GitHub Enterprise Cloud.  
            /// \* `none` - only admin members can create repositories.  
            /// **Note:** This parameter is deprecated and will be removed in the future. Its return value ignores internal repositories. Using this parameter overrides values set in `members_can_create_repositories`. See the parameter deprecation notice in the operation description for details.
            public enum MembersAllowedRepositoryCreationType: String, Codable, CaseIterable {
                case all
                case `private`
                case `none`
            }

            public init(billingEmail: String? = nil, company: String? = nil, email: String? = nil, twitterUsername: String? = nil, location: String? = nil, name: String? = nil, description: String? = nil, hasOrganizationProjects: Bool? = nil, hasRepositoryProjects: Bool? = nil, defaultRepositoryPermission: DefaultRepositoryPermission? = nil, membersCanCreateRepositories: Bool? = nil, membersCanCreateInternalRepositories: Bool? = nil, membersCanCreatePrivateRepositories: Bool? = nil, membersCanCreatePublicRepositories: Bool? = nil, membersAllowedRepositoryCreationType: MembersAllowedRepositoryCreationType? = nil, membersCanCreatePages: Bool? = nil, membersCanCreatePublicPages: Bool? = nil, membersCanCreatePrivatePages: Bool? = nil, membersCanForkPrivateRepositories: Bool? = nil, blog: String? = nil) {
                self.billingEmail = billingEmail
                self.company = company
                self.email = email
                self.twitterUsername = twitterUsername
                self.location = location
                self.name = name
                self.description = description
                self.hasOrganizationProjects = hasOrganizationProjects
                self.hasRepositoryProjects = hasRepositoryProjects
                self.defaultRepositoryPermission = defaultRepositoryPermission
                self.membersCanCreateRepositories = membersCanCreateRepositories ?? true
                self.membersCanCreateInternalRepositories = membersCanCreateInternalRepositories
                self.membersCanCreatePrivateRepositories = membersCanCreatePrivateRepositories
                self.membersCanCreatePublicRepositories = membersCanCreatePublicRepositories
                self.membersAllowedRepositoryCreationType = membersAllowedRepositoryCreationType
                self.membersCanCreatePages = membersCanCreatePages ?? true
                self.membersCanCreatePublicPages = membersCanCreatePublicPages ?? true
                self.membersCanCreatePrivatePages = membersCanCreatePrivatePages ?? true
                self.membersCanForkPrivateRepositories = membersCanForkPrivateRepositories ?? false
                self.blog = blog
            }

            private enum CodingKeys: String, CodingKey {
                case billingEmail = "billing_email"
                case company
                case email
                case twitterUsername = "twitter_username"
                case location
                case name
                case description
                case hasOrganizationProjects = "has_organization_projects"
                case hasRepositoryProjects = "has_repository_projects"
                case defaultRepositoryPermission = "default_repository_permission"
                case membersCanCreateRepositories = "members_can_create_repositories"
                case membersCanCreateInternalRepositories = "members_can_create_internal_repositories"
                case membersCanCreatePrivateRepositories = "members_can_create_private_repositories"
                case membersCanCreatePublicRepositories = "members_can_create_public_repositories"
                case membersAllowedRepositoryCreationType = "members_allowed_repository_creation_type"
                case membersCanCreatePages = "members_can_create_pages"
                case membersCanCreatePublicPages = "members_can_create_public_pages"
                case membersCanCreatePrivatePages = "members_can_create_private_pages"
                case membersCanForkPrivateRepositories = "members_can_fork_private_repositories"
                case blog
            }
        }
    }
}
