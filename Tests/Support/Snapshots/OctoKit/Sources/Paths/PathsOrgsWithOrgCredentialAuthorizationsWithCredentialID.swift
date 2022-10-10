// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.Orgs.WithOrg.CredentialAuthorizations {
    public func credentialID(_ credentialID: Int) -> WithCredentialID {
        WithCredentialID(path: "\(path)/\(credentialID)")
    }

    public struct WithCredentialID {
        /// Path: `/orgs/{org}/credential-authorizations/{credential_id}`
        public let path: String

        /// Remove a SAML SSO authorization for an organization
        ///
        /// Listing and deleting credential authorizations is available to organizations with GitHub Enterprise Cloud. For more information, see [GitHub's products](https://help.github.com/github/getting-started-with-github/githubs-products).
        /// 
        /// An authenticated organization owner with the `admin:org` scope can remove a credential authorization for an organization that uses SAML SSO. Once you remove someone's credential authorization, they will need to create a new personal access token or SSH key and authorize it for the organization they want to access.
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/orgs#remove-a-saml-sso-authorization-for-an-organization)
        public var delete: Request<Void> {
            Request(path: path, method: "DELETE", id: "orgs/remove-saml-sso-authorization")
        }
    }
}
