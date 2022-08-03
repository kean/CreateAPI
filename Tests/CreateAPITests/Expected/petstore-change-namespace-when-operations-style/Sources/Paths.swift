// Generated by Create API
// https://github.com/CreateAPI/CreateAPI
//
// swiftlint:disable all

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Namespace {
    /// List all pets
    static public func listPets(limit: Int? = nil) -> Request<[petstore_change_namespace_when_operations_style.Pet]> {
        Request(method: "GET", url: "/pets", query: makeListPetsQuery(limit))
    }

    public enum ListPetsResponseHeaders {
        /// A link to the next page of responses
        public static let next = HTTPHeader<String>(field: "x-next")
    }

    private static func makeListPetsQuery(_ limit: Int?) -> [(String, String?)] {
        let encoder = URLQueryEncoder()
        encoder.encode(limit, forKey: "limit")
        return encoder.items
    }
}

extension Namespace {
    /// Create a pet
    static public var createPets: Request<Void> {
        Request(method: "POST", url: "/pets")
    }
}

extension Namespace {
    /// Info for a specific pet
    static public func showPetByID(petID: String) -> Request<petstore_change_namespace_when_operations_style.Pet> {
        Request(method: "GET", url: "/pets/\(petID)")
    }
}

public enum Namespace {}
