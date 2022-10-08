// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths {
    public static var zen: Zen {
        Zen(path: "/zen")
    }

    public struct Zen {
        /// Path: `/zen`
        public let path: String

        /// Get the Zen of GitHub
        ///
        /// Get a random sentence from the Zen of GitHub
        public var get: Request<String> {
            Request(path: path, method: "GET", id: "meta/get-zen")
        }
    }
}
