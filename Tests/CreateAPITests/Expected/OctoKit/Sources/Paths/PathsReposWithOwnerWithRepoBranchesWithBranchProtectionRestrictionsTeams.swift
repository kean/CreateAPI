// Generated by Create API
// https://github.com/CreateAPI/CreateAPI
//
// swiftlint:disable all

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.Repos.WithOwner.WithRepo.Branches.WithBranch.Protection.Restrictions {
    public var teams: Teams {
        Teams(path: path + "/teams")
    }

    public struct Teams {
        /// Path: `/repos/{owner}/{repo}/branches/{branch}/protection/restrictions/teams`
        public let path: String

        /// Get teams with access to the protected branch
        ///
        /// Protected branches are available in public repositories with GitHub Free and GitHub Free for organizations, and in public and private repositories with GitHub Pro, GitHub Team, GitHub Enterprise Cloud, and GitHub Enterprise Server. For more information, see [GitHub's products](https://help.github.com/github/getting-started-with-github/githubs-products) in the GitHub Help documentation.
        /// 
        /// Lists the teams who have push access to this branch. The list includes child teams.
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/repos#list-teams-with-access-to-the-protected-branch)
        public var get: Request<[OctoKit.Team]> {
            Request(method: "GET", url: path, id: "repos/get-teams-with-access-to-protected-branch")
        }

        /// Add team access restrictions
        ///
        /// Protected branches are available in public repositories with GitHub Free and GitHub Free for organizations, and in public and private repositories with GitHub Pro, GitHub Team, GitHub Enterprise Cloud, and GitHub Enterprise Server. For more information, see [GitHub's products](https://help.github.com/github/getting-started-with-github/githubs-products) in the GitHub Help documentation.
        /// 
        /// Grants the specified teams push access for this branch. You can also give push access to child teams.
        /// 
        /// | Type    | Description                                                                                                                                |
        /// | ------- | ------------------------------------------------------------------------------------------------------------------------------------------ |
        /// | `array` | The teams that can have push access. Use the team's `slug`. **Note**: The list of users, apps, and teams in total is limited to 100 items. |
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/repos#add-team-access-restrictions)
        public func post(_ body: PostRequest? = nil) -> Request<[OctoKit.Team]> {
            Request(method: "POST", url: path, body: body, id: "repos/add-team-access-restrictions")
        }

        public enum PostRequest: Encodable {
            case object(Object)
            case strings([String])

            /// Example:
            ///
            /// {
            ///   "teams" : [
            ///     "my-team"
            ///   ]
            /// }
            public struct Object: Encodable {
                /// Teams parameter
                public var teams: [String]

                public init(teams: [String]) {
                    self.teams = teams
                }
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.singleValueContainer()
                switch self {
                case .object(let value): try container.encode(value)
                case .strings(let value): try container.encode(value)
                }
            }
        }

        /// Set team access restrictions
        ///
        /// Protected branches are available in public repositories with GitHub Free and GitHub Free for organizations, and in public and private repositories with GitHub Pro, GitHub Team, GitHub Enterprise Cloud, and GitHub Enterprise Server. For more information, see [GitHub's products](https://help.github.com/github/getting-started-with-github/githubs-products) in the GitHub Help documentation.
        /// 
        /// Replaces the list of teams that have push access to this branch. This removes all teams that previously had push access and grants push access to the new list of teams. Team restrictions include child teams.
        /// 
        /// | Type    | Description                                                                                                                                |
        /// | ------- | ------------------------------------------------------------------------------------------------------------------------------------------ |
        /// | `array` | The teams that can have push access. Use the team's `slug`. **Note**: The list of users, apps, and teams in total is limited to 100 items. |
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/repos#set-team-access-restrictions)
        public func put(_ body: PutRequest? = nil) -> Request<[OctoKit.Team]> {
            Request(method: "PUT", url: path, body: body, id: "repos/set-team-access-restrictions")
        }

        public enum PutRequest: Encodable {
            case object(Object)
            case strings([String])

            /// Example:
            ///
            /// {
            ///   "teams" : [
            ///     "my-team"
            ///   ]
            /// }
            public struct Object: Encodable {
                /// Teams parameter
                public var teams: [String]

                public init(teams: [String]) {
                    self.teams = teams
                }
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.singleValueContainer()
                switch self {
                case .object(let value): try container.encode(value)
                case .strings(let value): try container.encode(value)
                }
            }
        }

        /// Remove team access restrictions
        ///
        /// Protected branches are available in public repositories with GitHub Free and GitHub Free for organizations, and in public and private repositories with GitHub Pro, GitHub Team, GitHub Enterprise Cloud, and GitHub Enterprise Server. For more information, see [GitHub's products](https://help.github.com/github/getting-started-with-github/githubs-products) in the GitHub Help documentation.
        /// 
        /// Removes the ability of a team to push to this branch. You can also remove push access for child teams.
        /// 
        /// | Type    | Description                                                                                                                                         |
        /// | ------- | --------------------------------------------------------------------------------------------------------------------------------------------------- |
        /// | `array` | Teams that should no longer have push access. Use the team's `slug`. **Note**: The list of users, apps, and teams in total is limited to 100 items. |
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/repos#remove-team-access-restrictions)
        public func delete(_ body: DeleteRequest? = nil) -> Request<[OctoKit.Team]> {
            Request(method: "DELETE", url: path, body: body, id: "repos/remove-team-access-restrictions")
        }

        public enum DeleteRequest: Encodable {
            case object(Object)
            case strings([String])

            /// Example:
            ///
            /// {
            ///   "teams" : [
            ///     "my-team"
            ///   ]
            /// }
            public struct Object: Encodable {
                /// Teams parameter
                public var teams: [String]

                public init(teams: [String]) {
                    self.teams = teams
                }
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.singleValueContainer()
                switch self {
                case .object(let value): try container.encode(value)
                case .strings(let value): try container.encode(value)
                }
            }
        }
    }
}
