// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.Orgs.WithOrg {
    public var credentialAuthorizations: CredentialAuthorizations {
        CredentialAuthorizations(path: path + "/credential-authorizations")
    }

    public struct CredentialAuthorizations {
        /// Path: `/orgs/{org}/credential-authorizations`
        public let path: String

        /// List SAML SSO authorizations for an organization
        ///
        /// Listing and deleting credential authorizations is available to organizations with GitHub Enterprise Cloud. For more information, see [GitHub's products](https://help.github.com/github/getting-started-with-github/githubs-products).
        /// 
        /// An authenticated organization owner with the `read:org` scope can list all credential authorizations for an organization that uses SAML single sign-on (SSO). The credentials are either personal access tokens or SSH keys that organization members have authorized for the organization. For more information, see [About authentication with SAML single sign-on](https://help.github.com/en/articles/about-authentication-with-saml-single-sign-on).
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/orgs#list-saml-sso-authorizations-for-an-organization)
        public var get: Request<[OctoKit.CredentialAuthorization]> {
            Request(path: path, method: "GET", id: "orgs/list-saml-sso-authorizations")
        }
    }
}
