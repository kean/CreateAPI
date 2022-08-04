// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.Repos.WithTemplateOwner {
    public func templateRepo(_ templateRepo: String) -> WithTemplateRepo {
        WithTemplateRepo(path: "\(path)/\(templateRepo)")
    }

    public struct WithTemplateRepo {
        /// Path: `/repos/{template_owner}/{template_repo}`
        public let path: String
    }
}
