// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.Repos.WithOwner.WithRepo.Zipball {
    public func ref(_ ref: String) -> WithRef {
        WithRef(path: "\(path)/\(ref)")
    }

    public struct WithRef {
        /// Path: `/repos/{owner}/{repo}/zipball/{ref}`
        public let path: String

        /// Download a repository archive (zip)
        ///
        /// Gets a redirect URL to download a zip archive for a repository. If you omit `:ref`, the repository’s default branch (usually
        /// `master`) will be used. Please make sure your HTTP framework is configured to follow redirects or you will need to use
        /// the `Location` header to make a second `GET` request.
        /// **Note**: For private repositories, these links are temporary and expire after five minutes.
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/repos#download-a-repository-archive)
        public var get: Request<Void> {
            Request(path: path, method: "GET", id: "repos/download-zipball-archive")
        }
    }
}
