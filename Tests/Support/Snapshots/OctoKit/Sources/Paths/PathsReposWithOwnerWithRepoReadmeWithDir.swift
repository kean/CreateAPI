// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.Repos.WithOwner.WithRepo.Readme {
    public func dir(_ dir: String) -> WithDir {
        WithDir(path: "\(path)/\(dir)")
    }

    public struct WithDir {
        /// Path: `/repos/{owner}/{repo}/readme/{dir}`
        public let path: String

        /// Get a repository README for a directory
        ///
        /// Gets the README from a repository directory.
        /// 
        /// READMEs support [custom media types](https://docs.github.com/rest/reference/repos#custom-media-types) for retrieving the raw content or rendered HTML.
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/repos#get-a-repository-directory-readme)
        public func get(ref: String? = nil) -> Request<OctoKit.ContentFile> {
            Request(path: path, method: "GET", query: makeGetQuery(ref), id: "repos/get-readme-in-directory")
        }

        private func makeGetQuery(_ ref: String?) -> [(String, String?)] {
            let encoder = URLQueryEncoder()
            encoder.encode(ref, forKey: "ref")
            return encoder.items
        }
    }
}
