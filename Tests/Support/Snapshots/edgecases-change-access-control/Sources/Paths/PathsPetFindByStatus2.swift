// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import NaiveDate
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.Pet {
    var findByStatus2: FindByStatus2 {
        FindByStatus2(path: path + "/findByStatus2")
    }

    struct FindByStatus2 {
        /// Path: `/pet/findByStatus2`
        let path: String

        /// Finds Pets by status
        ///
        /// Multiple status values can be provided with comma separated strings
        func get(status: [Status]? = nil) -> Request<[edgecases_change_access_control.Pet]> {
            Request(path: path, method: "GET", query: makeGetQuery(status), id: "findPetsByStatus2")
        }

        private func makeGetQuery(_ status: [Status]?) -> [(String, String?)] {
            let encoder = URLQueryEncoder()
            encoder.encode(status, forKey: "status")
            return encoder.items
        }

        enum Status: String, Codable, CaseIterable {
            case available
            case pending
            case sold
        }
    }
}
