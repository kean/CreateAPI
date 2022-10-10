// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.Repos.WithOwner.WithRepo.Actions {
    public var permissions: Permissions {
        Permissions(path: path + "/permissions")
    }

    public struct Permissions {
        /// Path: `/repos/{owner}/{repo}/actions/permissions`
        public let path: String

        /// Get GitHub Actions permissions for a repository
        ///
        /// Gets the GitHub Actions permissions policy for a repository, including whether GitHub Actions is enabled and the actions allowed to run in the repository.
        /// 
        /// You must authenticate using an access token with the `repo` scope to use this
        /// endpoint. GitHub Apps must have the `administration` repository permission to use this API.
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/actions#get-github-actions-permissions-for-a-repository)
        public var get: Request<OctoKit.ActionsRepositoryPermissions> {
            Request(path: path, method: "GET", id: "actions/get-github-actions-permissions-repository")
        }

        /// Set GitHub Actions permissions for a repository
        ///
        /// Sets the GitHub Actions permissions policy for enabling GitHub Actions and allowed actions in the repository.
        /// 
        /// If the repository belongs to an organization or enterprise that has set restrictive permissions at the organization or enterprise levels, such as `allowed_actions` to `selected` actions, then you cannot override them for the repository.
        /// 
        /// You must authenticate using an access token with the `repo` scope to use this endpoint. GitHub Apps must have the `administration` repository permission to use this API.
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/actions#set-github-actions-permissions-for-a-repository)
        public func put(_ body: PutRequest) -> Request<Void> {
            Request(path: path, method: "PUT", body: body, id: "actions/set-github-actions-permissions-repository")
        }

        public struct PutRequest: Encodable {
            /// Whether GitHub Actions is enabled on the repository.
            public var isEnabled: Bool
            /// The permissions policy that controls the actions that are allowed to run. Can be one of: `all`, `local_only`, or `selected`.
            public var allowedActions: OctoKit.AllowedActions?

            public init(isEnabled: Bool, allowedActions: OctoKit.AllowedActions? = nil) {
                self.isEnabled = isEnabled
                self.allowedActions = allowedActions
            }

            public func encode(to encoder: Encoder) throws {
                var values = encoder.container(keyedBy: StringCodingKey.self)
                try values.encode(isEnabled, forKey: "enabled")
                try values.encodeIfPresent(allowedActions, forKey: "allowed_actions")
            }
        }
    }
}
