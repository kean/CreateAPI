// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.Orgs.WithOrg {
    public var teams: Teams {
        Teams(path: path + "/teams")
    }

    public struct Teams {
        /// Path: `/orgs/{org}/teams`
        public let path: String

        /// List teams
        ///
        /// Lists all teams in an organization that are visible to the authenticated user.
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/teams#list-teams)
        public func get(perPage: Int? = nil, page: Int? = nil) -> Request<[OctoKit.Team]> {
            Request(method: "GET", url: path, query: makeGetQuery(perPage, page), id: "teams/list")
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

        /// Create a team
        ///
        /// To create a team, the authenticated user must be a member or owner of `{org}`. By default, organization members can create teams. Organization owners can limit team creation to organization owners. For more information, see "[Setting team creation permissions](https://help.github.com/en/articles/setting-team-creation-permissions-in-your-organization)."
        /// 
        /// When you create a new team, you automatically become a team maintainer without explicitly adding yourself to the optional array of `maintainers`. For more information, see "[About teams](https://help.github.com/en/github/setting-up-and-managing-organizations-and-teams/about-teams)".
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/teams#create-a-team)
        public func post(_ body: PostRequest) -> Request<OctoKit.TeamFull> {
            Request(method: "POST", url: path, body: body, id: "teams/create")
        }

        public struct PostRequest: Encodable {
            /// The name of the team.
            public var name: String
            /// The description of the team.
            public var description: String?
            /// List GitHub IDs for organization members who will become team maintainers.
            public var maintainers: [String]?
            /// The full name (e.g., "organization-name/repository-name") of repositories to add the team to.
            public var repoNames: [String]?
            /// The level of privacy this team should have. The options are:  
            /// **For a non-nested team:**  
            /// \* `secret` - only visible to organization owners and members of this team.  
            /// \* `closed` - visible to all members of this organization.  
            /// Default: `secret`  
            /// **For a parent or child team:**  
            /// \* `closed` - visible to all members of this organization.  
            /// Default for child team: `closed`
            public var privacy: Privacy?
            /// **Deprecated**. The permission that new repositories will be added to the team with when none is specified. Can be one of:  
            /// \* `pull` - team members can pull, but not push to or administer newly-added repositories.  
            /// \* `push` - team members can pull and push, but not administer newly-added repositories.  
            /// \* `admin` - team members can pull, push and administer newly-added repositories.
            public var permission: Permission?
            /// The ID of a team to set as the parent team.
            public var parentTeamID: Int?

            /// The level of privacy this team should have. The options are:  
            /// **For a non-nested team:**  
            /// \* `secret` - only visible to organization owners and members of this team.  
            /// \* `closed` - visible to all members of this organization.  
            /// Default: `secret`  
            /// **For a parent or child team:**  
            /// \* `closed` - visible to all members of this organization.  
            /// Default for child team: `closed`
            public enum Privacy: String, Codable, CaseIterable {
                case secret
                case closed
            }

            /// **Deprecated**. The permission that new repositories will be added to the team with when none is specified. Can be one of:  
            /// \* `pull` - team members can pull, but not push to or administer newly-added repositories.  
            /// \* `push` - team members can pull and push, but not administer newly-added repositories.  
            /// \* `admin` - team members can pull, push and administer newly-added repositories.
            public enum Permission: String, Codable, CaseIterable {
                case pull
                case push
                case admin
            }

            public init(name: String, description: String? = nil, maintainers: [String]? = nil, repoNames: [String]? = nil, privacy: Privacy? = nil, permission: Permission? = nil, parentTeamID: Int? = nil) {
                self.name = name
                self.description = description
                self.maintainers = maintainers
                self.repoNames = repoNames
                self.privacy = privacy
                self.permission = permission
                self.parentTeamID = parentTeamID
            }

            public func encode(to encoder: Encoder) throws {
                var values = encoder.container(keyedBy: StringCodingKey.self)
                try values.encode(name, forKey: "name")
                try values.encodeIfPresent(description, forKey: "description")
                try values.encodeIfPresent(maintainers, forKey: "maintainers")
                try values.encodeIfPresent(repoNames, forKey: "repo_names")
                try values.encodeIfPresent(privacy, forKey: "privacy")
                try values.encodeIfPresent(permission, forKey: "permission")
                try values.encodeIfPresent(parentTeamID, forKey: "parent_team_id")
            }
        }
    }
}
