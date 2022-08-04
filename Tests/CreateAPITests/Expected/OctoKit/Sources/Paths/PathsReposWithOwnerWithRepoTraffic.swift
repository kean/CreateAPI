// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.Repos.WithOwner.WithRepo {
    public var traffic: Traffic {
        Traffic(path: path + "/traffic")
    }

    public struct Traffic {
        /// Path: `/repos/{owner}/{repo}/traffic`
        public let path: String
    }
}
