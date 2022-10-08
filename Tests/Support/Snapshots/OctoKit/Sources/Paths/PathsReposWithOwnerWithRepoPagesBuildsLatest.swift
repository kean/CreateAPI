// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.Repos.WithOwner.WithRepo.Pages.Builds {
    public var latest: Latest {
        Latest(path: path + "/latest")
    }

    public struct Latest {
        /// Path: `/repos/{owner}/{repo}/pages/builds/latest`
        public let path: String

        /// Get latest Pages build
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/repos#get-latest-pages-build)
        public var get: Request<OctoKit.PageBuild> {
            Request(path: path, method: "GET", id: "repos/get-latest-pages-build")
        }
    }
}
