// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.Orgs.WithOrg.Actions {
    public var permissions: Permissions {
        Permissions(path: path + "/permissions")
    }

    public struct Permissions {
        /// Path: `/orgs/{org}/actions/permissions`
        public let path: String

        /// Get GitHub Actions permissions for an organization
        ///
        /// Gets the GitHub Actions permissions policy for repositories and allowed actions in an organization.
        /// 
        /// You must authenticate using an access token with the `admin:org` scope to use this endpoint. GitHub Apps must have the `administration` organization permission to use this API.
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/actions#get-github-actions-permissions-for-an-organization)
        public var get: Request<OctoKit.ActionsOrganizationPermissions> {
            Request(method: "GET", url: path, id: "actions/get-github-actions-permissions-organization")
        }

        /// Set GitHub Actions permissions for an organization
        ///
        /// Sets the GitHub Actions permissions policy for repositories and allowed actions in an organization.
        /// 
        /// If the organization belongs to an enterprise that has set restrictive permissions at the enterprise level, such as `allowed_actions` to `selected` actions, then you cannot override them for the organization.
        /// 
        /// You must authenticate using an access token with the `admin:org` scope to use this endpoint. GitHub Apps must have the `administration` organization permission to use this API.
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/actions#set-github-actions-permissions-for-an-organization)
        public func put(_ body: PutRequest) -> Request<Void> {
            Request(method: "PUT", url: path, body: body, id: "actions/set-github-actions-permissions-organization")
        }

        public struct PutRequest: Encodable {
            /// The policy that controls the repositories in the organization that are allowed to run GitHub Actions. Can be one of: `all`, `none`, or `selected`.
            public var enabledRepositories: OctoKit.EnabledRepositories
            /// The permissions policy that controls the actions that are allowed to run. Can be one of: `all`, `local_only`, or `selected`.
            public var allowedActions: OctoKit.AllowedActions?

            public init(enabledRepositories: OctoKit.EnabledRepositories, allowedActions: OctoKit.AllowedActions? = nil) {
                self.enabledRepositories = enabledRepositories
                self.allowedActions = allowedActions
            }

            private enum CodingKeys: String, CodingKey {
                case enabledRepositories = "enabled_repositories"
                case allowedActions = "allowed_actions"
            }
        }
    }
}
