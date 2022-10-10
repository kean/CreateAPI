// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import NaiveDate
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.Store {
    public var order: Order {
        Order(path: path + "/order")
    }

    public struct Order {
        /// Path: `/store/order`
        public let path: String

        /// Place an order for a pet
        public func post(_ body: edgecases_disable_enums.Order) -> Request<edgecases_disable_enums.Order> {
            Request(path: path, method: "POST", body: body, id: "placeOrder")
        }
    }
}
