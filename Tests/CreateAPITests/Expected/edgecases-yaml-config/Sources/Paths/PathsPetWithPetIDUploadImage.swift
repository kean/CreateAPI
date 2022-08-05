// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import NaiveDate
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.Pet.WithPetID {
    public var uploadImage: UploadImage {
        UploadImage(path: path + "/uploadImage")
    }

    public struct UploadImage {
        /// Path: `/pet/{petId}/uploadImage`
        public let path: String

        /// Uploads an image
        public func post(_ body: Data? = nil) -> Request<edgecases_yaml_config.APIResponse> {
            Request(method: "POST", url: path, body: body, id: "uploadFile")
        }
    }
}
