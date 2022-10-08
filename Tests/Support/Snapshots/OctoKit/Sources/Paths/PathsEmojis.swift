// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths {
    public static var emojis: Emojis {
        Emojis(path: "/emojis")
    }

    public struct Emojis {
        /// Path: `/emojis`
        public let path: String

        /// Get emojis
        ///
        /// Lists all the emojis available to use on GitHub.
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/emojis#get-emojis)
        public var get: Request<[String: String]> {
            Request(path: path, method: "GET", id: "emojis/get")
        }
    }
}
