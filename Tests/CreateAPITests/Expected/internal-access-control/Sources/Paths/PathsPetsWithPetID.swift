// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.Pets {
    func petID(_ petID: String) -> WithPetID {
        WithPetID(path: "\(path)/\(petID)")
    }

    struct WithPetID {
        /// Path: `/pets/{petId}`
        let path: String

        /// Info for a specific pet
        var get: Request<internal_access_control.Pet> {
            Request(method: "GET", url: path, id: "showPetById")
        }
    }
}
