// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import NaiveDate
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.Pet {
    func petID(_ petID: Int) -> WithPetID {
        WithPetID(path: "\(path)/\(petID)")
    }

    struct WithPetID {
        /// Path: `/pet/{petId}`
        let path: String

        /// Find pet by ID
        ///
        /// Returns a single pet
        var get: Request<edgecases_change_access_control.Pet> {
            Request(method: "GET", url: path, id: "getPetById")
        }

        /// Updates a pet in the store with form data
        func post(_ body: PostRequest? = nil) -> Request<Void> {
            Request(method: "POST", url: path, body: body.map(URLQueryEncoder.encode)?.percentEncodedQuery, id: "updatePetWithForm")
        }

        struct PostRequest: Encodable {
            /// Updated name of the pet
            var name: String?
            /// Updated status of the pet
            var status: String?

            init(name: String? = nil, status: String? = nil) {
                self.name = name
                self.status = status
            }

            var asQuery: [(String, String?)] {
                let encoder = URLQueryEncoder()
                encoder.encode(name, forKey: "name")
                encoder.encode(status, forKey: "status")
                return encoder.items
            }
        }

        /// Deletes a pet
        var delete: Request<Void> {
            Request(method: "DELETE", url: path, id: "deletePet")
        }
    }
}
