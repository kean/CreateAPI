// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.Orgs.WithOrg.Packages.WithPackageType.WithPackageName.Versions.WithPackageVersionID {
    public var restore: Restore {
        Restore(path: path + "/restore")
    }

    public struct Restore {
        /// Path: `/orgs/{org}/packages/{package_type}/{package_name}/versions/{package_version_id}/restore`
        public let path: String

        /// Restore package version for an organization
        ///
        /// Restores a specific package version in an organization.
        /// 
        /// You can restore a deleted package under the following conditions:
        ///   - The package was deleted within the last 30 days.
        ///   - The same package namespace and version is still available and not reused for a new package. If the same package namespace is not available, you will not be able to restore your package. In this scenario, to restore the deleted package, you must delete the new package that uses the deleted package's namespace first.
        /// 
        /// To use this endpoint, you must have admin permissions in the organization and authenticate using an access token with the `packages:read` and `packages:write` scopes. In addition:
        /// - If `package_type` is not `container`, your token must also include the `repo` scope.
        /// - If `package_type` is `container`, you must also have admin permissions to the container that you want to restore.
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/packages#restore-a-package-version-for-an-organization)
        public var post: Request<Void> {
            Request(path: path, method: "POST", id: "packages/restore-package-version-for-org")
        }
    }
}
