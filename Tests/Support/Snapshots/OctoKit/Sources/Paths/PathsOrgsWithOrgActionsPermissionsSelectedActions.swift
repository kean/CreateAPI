// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.Orgs.WithOrg.Actions.Permissions {
    public var selectedActions: SelectedActions {
        SelectedActions(path: path + "/selected-actions")
    }

    public struct SelectedActions {
        /// Path: `/orgs/{org}/actions/permissions/selected-actions`
        public let path: String

        /// Get allowed actions for an organization
        ///
        /// Gets the selected actions that are allowed in an organization. To use this endpoint, the organization permission policy for `allowed_actions` must be configured to `selected`. For more information, see "[Set GitHub Actions permissions for an organization](#set-github-actions-permissions-for-an-organization).""
        /// 
        /// You must authenticate using an access token with the `admin:org` scope to use this endpoint. GitHub Apps must have the `administration` organization permission to use this API.
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/actions#get-allowed-actions-for-an-organization)
        public var get: Request<OctoKit.SelectedActions> {
            Request(path: path, method: "GET", id: "actions/get-allowed-actions-organization")
        }

        /// Set allowed actions for an organization
        ///
        /// Sets the actions that are allowed in an organization. To use this endpoint, the organization permission policy for `allowed_actions` must be configured to `selected`. For more information, see "[Set GitHub Actions permissions for an organization](#set-github-actions-permissions-for-an-organization)."
        /// 
        /// If the organization belongs to an enterprise that has `selected` actions set at the enterprise level, then you cannot override any of the enterprise's allowed actions settings.
        /// 
        /// To use the `patterns_allowed` setting for private repositories, the organization must belong to an enterprise. If the organization does not belong to an enterprise, then the `patterns_allowed` setting only applies to public repositories in the organization.
        /// 
        /// You must authenticate using an access token with the `admin:org` scope to use this endpoint. GitHub Apps must have the `administration` organization permission to use this API.
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/actions#set-allowed-actions-for-an-organization)
        public func put(_ body: OctoKit.SelectedActions? = nil) -> Request<Void> {
            Request(path: path, method: "PUT", body: body, id: "actions/set-allowed-actions-organization")
        }
    }
}
