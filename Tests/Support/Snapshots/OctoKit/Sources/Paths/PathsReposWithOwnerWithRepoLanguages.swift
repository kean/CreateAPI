// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.Repos.WithOwner.WithRepo {
    public var languages: Languages {
        Languages(path: path + "/languages")
    }

    public struct Languages {
        /// Path: `/repos/{owner}/{repo}/languages`
        public let path: String

        /// List repository languages
        ///
        /// Lists languages for the specified repository. The value shown for each language is the number of bytes of code written in that language.
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/repos#list-repository-languages)
        public var get: Request<[String: Int]> {
            Request(path: path, method: "GET", id: "repos/list-languages")
        }
    }
}
