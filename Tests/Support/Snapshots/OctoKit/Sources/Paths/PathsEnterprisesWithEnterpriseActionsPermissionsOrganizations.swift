// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.Enterprises.WithEnterprise.Actions.Permissions {
    public var organizations: Organizations {
        Organizations(path: path + "/organizations")
    }

    public struct Organizations {
        /// Path: `/enterprises/{enterprise}/actions/permissions/organizations`
        public let path: String

        /// List selected organizations enabled for GitHub Actions in an enterprise
        ///
        /// Lists the organizations that are selected to have GitHub Actions enabled in an enterprise. To use this endpoint, the enterprise permission policy for `enabled_organizations` must be configured to `selected`. For more information, see "[Set GitHub Actions permissions for an enterprise](#set-github-actions-permissions-for-an-enterprise)."
        /// 
        /// You must authenticate using an access token with the `admin:enterprise` scope to use this endpoint.
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/enterprise-admin#list-selected-organizations-enabled-for-github-actions-in-an-enterprise)
        public func get(perPage: Int? = nil, page: Int? = nil) -> Request<GetResponse> {
            Request(path: path, method: "GET", query: makeGetQuery(perPage, page), id: "enterprise-admin/list-selected-organizations-enabled-github-actions-enterprise")
        }

        public struct GetResponse: Decodable {
            public var totalCount: Double
            public var organizations: [OctoKit.OrganizationSimple]

            public init(totalCount: Double, organizations: [OctoKit.OrganizationSimple]) {
                self.totalCount = totalCount
                self.organizations = organizations
            }

            public init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: StringCodingKey.self)
                self.totalCount = try values.decode(Double.self, forKey: "total_count")
                self.organizations = try values.decode([OctoKit.OrganizationSimple].self, forKey: "organizations")
            }
        }

        private func makeGetQuery(_ perPage: Int?, _ page: Int?) -> [(String, String?)] {
            let encoder = URLQueryEncoder()
            encoder.encode(perPage, forKey: "per_page")
            encoder.encode(page, forKey: "page")
            return encoder.items
        }

        /// Set selected organizations enabled for GitHub Actions in an enterprise
        ///
        /// Replaces the list of selected organizations that are enabled for GitHub Actions in an enterprise. To use this endpoint, the enterprise permission policy for `enabled_organizations` must be configured to `selected`. For more information, see "[Set GitHub Actions permissions for an enterprise](#set-github-actions-permissions-for-an-enterprise)."
        /// 
        /// You must authenticate using an access token with the `admin:enterprise` scope to use this endpoint.
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/enterprise-admin#set-selected-organizations-enabled-for-github-actions-in-an-enterprise)
        public func put(selectedOrganizationIDs: [Int]) -> Request<Void> {
            Request(path: path, method: "PUT", body: ["selected_organization_ids": selectedOrganizationIDs], id: "enterprise-admin/set-selected-organizations-enabled-github-actions-enterprise")
        }
    }
}
