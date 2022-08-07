// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.Enterprises.WithEnterprise.Actions {
    public var permissions: Permissions {
        Permissions(path: path + "/permissions")
    }

    public struct Permissions {
        /// Path: `/enterprises/{enterprise}/actions/permissions`
        public let path: String

        /// Get GitHub Actions permissions for an enterprise
        ///
        /// Gets the GitHub Actions permissions policy for organizations and allowed actions in an enterprise.
        /// 
        /// You must authenticate using an access token with the `admin:enterprise` scope to use this endpoint.
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/enterprise-admin#get-github-actions-permissions-for-an-enterprise)
        public var get: Request<OctoKit.ActionsEnterprisePermissions> {
            Request(method: "GET", url: path, id: "enterprise-admin/get-github-actions-permissions-enterprise")
        }

        /// Set GitHub Actions permissions for an enterprise
        ///
        /// Sets the GitHub Actions permissions policy for organizations and allowed actions in an enterprise.
        /// 
        /// You must authenticate using an access token with the `admin:enterprise` scope to use this endpoint.
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/enterprise-admin#set-github-actions-permissions-for-an-enterprise)
        public func put(_ body: PutRequest) -> Request<Void> {
            Request(method: "PUT", url: path, body: body, id: "enterprise-admin/set-github-actions-permissions-enterprise")
        }

        public struct PutRequest: Encodable {
            /// The policy that controls the organizations in the enterprise that are allowed to run GitHub Actions. Can be one of: `all`, `none`, or `selected`.
            public var enabledOrganizations: OctoKit.EnabledOrganizations
            /// The permissions policy that controls the actions that are allowed to run. Can be one of: `all`, `local_only`, or `selected`.
            public var allowedActions: OctoKit.AllowedActions?

            public init(enabledOrganizations: OctoKit.EnabledOrganizations, allowedActions: OctoKit.AllowedActions? = nil) {
                self.enabledOrganizations = enabledOrganizations
                self.allowedActions = allowedActions
            }

            public func encode(to encoder: Encoder) throws {
                var values = encoder.container(keyedBy: StringCodingKey.self)
                try values.encode(enabledOrganizations, forKey: "enabled_organizations")
                try values.encodeIfPresent(allowedActions, forKey: "allowed_actions")
            }
        }
    }
}
