// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import NaiveDate
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.Pet {
    var findByTags: FindByTags {
        FindByTags(path: path + "/findByTags")
    }

    struct FindByTags {
        /// Path: `/pet/findByTags`
        let path: String

        /// Finds Pets by tags
        ///
        /// Multiple tags can be provided with comma separated strings. Use tag1, tag2, tag3 for testing.
        func get(tags: [String]) -> Request<[edgecases_change_access_control.Pet]> {
            Request(method: "GET", url: path, query: makeGetQuery(tags), id: "findPetsByTags")
        }

        private func makeGetQuery(_ tags: [String]) -> [(String, String?)] {
            let encoder = URLQueryEncoder()
            encoder.encode(tags, forKey: "tags", explode: false)
            return encoder.items
        }
    }
}
