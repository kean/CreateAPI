// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import NaiveDate
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.Store {
    public var inventory: Inventory {
        Inventory(path: path + "/inventory")
    }

    public struct Inventory {
        /// Path: `/store/inventory`
        public let path: String

        /// Returns pet inventories by status
        ///
        /// Returns a map of status codes to quantities
        public var get: Request<[String: Int32]> {
            Request(path: path, method: "GET", id: "getInventory")
        }
    }
}
