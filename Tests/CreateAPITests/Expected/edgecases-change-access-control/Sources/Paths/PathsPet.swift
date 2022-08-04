// Generated by Create API
// https://github.com/CreateAPI/CreateAPI
//
// swiftlint:disable all

import Foundation
import NaiveDate
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths {
    static var pet: Pet {
        Pet(path: "/pet")
    }

    struct Pet {
        /// Path: `/pet`
        let path: String

        /// Add a new pet to the store
        func post(_ body: edgecases_change_access_control.Pet) -> Request<Void> {
            Request(method: "POST", url: path, body: body)
        }

        /// Update an existing pet
        func put(_ body: edgecases_change_access_control.Pet) -> Request<Void> {
            Request(method: "PUT", url: path, body: body)
        }
    }
}