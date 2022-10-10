// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Namespace {
    public static var pets: Pets {
        Pets(path: "/pets")
    }

    public struct Pets {
        /// Path: `/pets`
        public let path: String

        /// List all pets
        public func get(limit: Int32? = nil) -> Request<[petstore_change_namespace_when_rest_style.Pet]> {
            Request(path: path, method: "GET", query: makeGetQuery(limit), id: "listPets")
        }

        public enum GetResponseHeaders {
            /// A link to the next page of responses
            public static let next = HTTPHeader<String>(field: "x-next")
        }

        private func makeGetQuery(_ limit: Int32?) -> [(String, String?)] {
            let encoder = URLQueryEncoder()
            encoder.encode(limit, forKey: "limit")
            return encoder.items
        }

        /// Create a pet
        public var post: Request<Void> {
            Request(path: path, method: "POST", id: "createPets")
        }
    }
}
