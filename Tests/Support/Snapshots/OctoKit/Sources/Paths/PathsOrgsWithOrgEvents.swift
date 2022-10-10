// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.Orgs.WithOrg {
    public var events: Events {
        Events(path: path + "/events")
    }

    public struct Events {
        /// Path: `/orgs/{org}/events`
        public let path: String

        /// List public organization events
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/activity#list-public-organization-events)
        public func get(perPage: Int? = nil, page: Int? = nil) -> Request<[OctoKit.Event]> {
            Request(path: path, method: "GET", query: makeGetQuery(perPage, page), id: "activity/list-public-org-events")
        }

        private func makeGetQuery(_ perPage: Int?, _ page: Int?) -> [(String, String?)] {
            let encoder = URLQueryEncoder()
            encoder.encode(perPage, forKey: "per_page")
            encoder.encode(page, forKey: "page")
            return encoder.items
        }
    }
}
