// Generated by Create API
// https://github.com/CreateAPI/CreateAPI
//
// swiftlint:disable all

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths {
    public static var octocat: Octocat {
        Octocat(path: "/octocat")
    }

    public struct Octocat {
        /// Path: `/octocat`
        public let path: String

        /// Get Octocat
        ///
        /// Get the octocat as ASCII art
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/meta#get-octocat)
        public func get(s: String? = nil) -> Request<String> {
            Request(method: "GET", url: path, query: makeGetQuery(s), id: "meta/get-octocat")
        }

        private func makeGetQuery(_ s: String?) -> [(String, String?)] {
            let encoder = URLQueryEncoder()
            encoder.encode(s, forKey: "s")
            return encoder.items
        }
    }
}
