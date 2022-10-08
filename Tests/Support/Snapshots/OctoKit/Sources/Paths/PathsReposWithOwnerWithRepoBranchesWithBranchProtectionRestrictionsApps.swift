// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.Repos.WithOwner.WithRepo.Branches.WithBranch.Protection.Restrictions {
    public var apps: Apps {
        Apps(path: path + "/apps")
    }

    public struct Apps {
        /// Path: `/repos/{owner}/{repo}/branches/{branch}/protection/restrictions/apps`
        public let path: String

        /// Get apps with access to the protected branch
        ///
        /// Protected branches are available in public repositories with GitHub Free and GitHub Free for organizations, and in public and private repositories with GitHub Pro, GitHub Team, GitHub Enterprise Cloud, and GitHub Enterprise Server. For more information, see [GitHub's products](https://help.github.com/github/getting-started-with-github/githubs-products) in the GitHub Help documentation.
        /// 
        /// Lists the GitHub Apps that have push access to this branch. Only installed GitHub Apps with `write` access to the `contents` permission can be added as authorized actors on a protected branch.
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/repos#list-apps-with-access-to-the-protected-branch)
        public var get: Request<[OctoKit.Integration]> {
            Request(path: path, method: "GET", id: "repos/get-apps-with-access-to-protected-branch")
        }

        /// Add app access restrictions
        ///
        /// Protected branches are available in public repositories with GitHub Free and GitHub Free for organizations, and in public and private repositories with GitHub Pro, GitHub Team, GitHub Enterprise Cloud, and GitHub Enterprise Server. For more information, see [GitHub's products](https://help.github.com/github/getting-started-with-github/githubs-products) in the GitHub Help documentation.
        /// 
        /// Grants the specified apps push access for this branch. Only installed GitHub Apps with `write` access to the `contents` permission can be added as authorized actors on a protected branch.
        /// 
        /// | Type    | Description                                                                                                                                                |
        /// | ------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------- |
        /// | `array` | The GitHub Apps that have push access to this branch. Use the app's `slug`. **Note**: The list of users, apps, and teams in total is limited to 100 items. |
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/repos#add-app-access-restrictions)
        public func post(_ body: PostRequest? = nil) -> Request<[OctoKit.Integration]> {
            Request(path: path, method: "POST", body: body, id: "repos/add-app-access-restrictions")
        }

        public enum PostRequest: Encodable {
            case object(Object)
            case strings([String])

            /// Example:
            ///
            /// {
            ///   "apps" : [
            ///     "my-app"
            ///   ]
            /// }
            public struct Object: Encodable {
                /// Apps parameter
                public var apps: [String]

                public init(apps: [String]) {
                    self.apps = apps
                }

                public func encode(to encoder: Encoder) throws {
                    var values = encoder.container(keyedBy: StringCodingKey.self)
                    try values.encode(apps, forKey: "apps")
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

        /// Set app access restrictions
        ///
        /// Protected branches are available in public repositories with GitHub Free and GitHub Free for organizations, and in public and private repositories with GitHub Pro, GitHub Team, GitHub Enterprise Cloud, and GitHub Enterprise Server. For more information, see [GitHub's products](https://help.github.com/github/getting-started-with-github/githubs-products) in the GitHub Help documentation.
        /// 
        /// Replaces the list of apps that have push access to this branch. This removes all apps that previously had push access and grants push access to the new list of apps. Only installed GitHub Apps with `write` access to the `contents` permission can be added as authorized actors on a protected branch.
        /// 
        /// | Type    | Description                                                                                                                                                |
        /// | ------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------- |
        /// | `array` | The GitHub Apps that have push access to this branch. Use the app's `slug`. **Note**: The list of users, apps, and teams in total is limited to 100 items. |
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/repos#set-app-access-restrictions)
        public func put(_ body: PutRequest? = nil) -> Request<[OctoKit.Integration]> {
            Request(path: path, method: "PUT", body: body, id: "repos/set-app-access-restrictions")
        }

        public enum PutRequest: Encodable {
            case object(Object)
            case strings([String])

            /// Example:
            ///
            /// {
            ///   "apps" : [
            ///     "my-app"
            ///   ]
            /// }
            public struct Object: Encodable {
                /// Apps parameter
                public var apps: [String]

                public init(apps: [String]) {
                    self.apps = apps
                }

                public func encode(to encoder: Encoder) throws {
                    var values = encoder.container(keyedBy: StringCodingKey.self)
                    try values.encode(apps, forKey: "apps")
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

        /// Remove app access restrictions
        ///
        /// Protected branches are available in public repositories with GitHub Free and GitHub Free for organizations, and in public and private repositories with GitHub Pro, GitHub Team, GitHub Enterprise Cloud, and GitHub Enterprise Server. For more information, see [GitHub's products](https://help.github.com/github/getting-started-with-github/githubs-products) in the GitHub Help documentation.
        /// 
        /// Removes the ability of an app to push to this branch. Only installed GitHub Apps with `write` access to the `contents` permission can be added as authorized actors on a protected branch.
        /// 
        /// | Type    | Description                                                                                                                                                |
        /// | ------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------- |
        /// | `array` | The GitHub Apps that have push access to this branch. Use the app's `slug`. **Note**: The list of users, apps, and teams in total is limited to 100 items. |
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/repos#remove-app-access-restrictions)
        public func delete(_ body: DeleteRequest? = nil) -> Request<[OctoKit.Integration]> {
            Request(path: path, method: "DELETE", body: body, id: "repos/remove-app-access-restrictions")
        }

        public enum DeleteRequest: Encodable {
            case object(Object)
            case strings([String])

            /// Example:
            ///
            /// {
            ///   "apps" : [
            ///     "my-app"
            ///   ]
            /// }
            public struct Object: Encodable {
                /// Apps parameter
                public var apps: [String]

                public init(apps: [String]) {
                    self.apps = apps
                }

                public func encode(to encoder: Encoder) throws {
                    var values = encoder.container(keyedBy: StringCodingKey.self)
                    try values.encode(apps, forKey: "apps")
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
