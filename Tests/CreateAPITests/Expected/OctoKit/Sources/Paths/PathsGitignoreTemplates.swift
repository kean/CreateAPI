// Generated by Create API
// https://github.com/CreateAPI/CreateAPI
//
// swiftlint:disable all

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.Gitignore {
    public var templates: Templates {
        Templates(path: path + "/templates")
    }

    public struct Templates {
        /// Path: `/gitignore/templates`
        public let path: String

        /// Get all gitignore templates
        ///
        /// List all templates available to pass as an option when [creating a repository](https://docs.github.com/rest/reference/repos#create-a-repository-for-the-authenticated-user).
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/gitignore#get-all-gitignore-templates)
        public var get: Request<[String]> {
            Request(method: "GET", url: path, id: "gitignore/get-all-templates")
        }
    }
}
