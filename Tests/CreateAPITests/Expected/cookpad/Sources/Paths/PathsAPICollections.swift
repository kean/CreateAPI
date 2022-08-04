// Generated by Create API
// https://github.com/CreateAPI/CreateAPI
//
// swiftlint:disable all

import Foundation
import Get

extension Paths {
    public static var collections: Collections {
        Collections(path: "/api/collections")
    }

    public struct Collections {
        /// Path: `/api/collections`
        public let path: String

        /// All Collections
        ///
        /// Returns an array of all Collection models in display order.
        public var get: Request<[cookpad.Collection]> {
            Request(method: "GET", url: path, id: "getAllCollections")
        }
    }
}
