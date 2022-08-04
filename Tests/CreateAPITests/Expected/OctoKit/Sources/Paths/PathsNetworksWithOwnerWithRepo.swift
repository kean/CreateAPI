// Generated by Create API
// https://github.com/CreateAPI/CreateAPI
//
// swiftlint:disable all

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.Networks.WithOwner {
    public func repo(_ repo: String) -> WithRepo {
        WithRepo(path: "\(path)/\(repo)")
    }

    public struct WithRepo {
        /// Path: `/networks/{owner}/{repo}`
        public let path: String
    }
}