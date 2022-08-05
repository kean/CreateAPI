// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.Repos.WithOwner.WithRepo.Git {
    public var tags: Tags {
        Tags(path: path + "/tags")
    }

    public struct Tags {
        /// Path: `/repos/{owner}/{repo}/git/tags`
        public let path: String

        /// Create a tag object
        ///
        /// Note that creating a tag object does not create the reference that makes a tag in Git. If you want to create an annotated tag in Git, you have to do this call to create the tag object, and then [create](https://docs.github.com/rest/reference/git#create-a-reference) the `refs/tags/[tag]` reference. If you want to create a lightweight tag, you only have to [create](https://docs.github.com/rest/reference/git#create-a-reference) the tag reference - this call would be unnecessary.
        /// 
        /// **Signature verification object**
        /// 
        /// The response will include a `verification` object that describes the result of verifying the commit's signature. The following fields are included in the `verification` object:
        /// 
        /// | Name | Type | Description |
        /// | ---- | ---- | ----------- |
        /// | `verified` | `boolean` | Indicates whether GitHub considers the signature in this commit to be verified. |
        /// | `reason` | `string` | The reason for verified value. Possible values and their meanings are enumerated in table below. |
        /// | `signature` | `string` | The signature that was extracted from the commit. |
        /// | `payload` | `string` | The value that was signed. |
        /// 
        /// These are the possible values for `reason` in the `verification` object:
        /// 
        /// | Value | Description |
        /// | ----- | ----------- |
        /// | `expired_key` | The key that made the signature is expired. |
        /// | `not_signing_key` | The "signing" flag is not among the usage flags in the GPG key that made the signature. |
        /// | `gpgverify_error` | There was an error communicating with the signature verification service. |
        /// | `gpgverify_unavailable` | The signature verification service is currently unavailable. |
        /// | `unsigned` | The object does not include a signature. |
        /// | `unknown_signature_type` | A non-PGP signature was found in the commit. |
        /// | `no_user` | No user was associated with the `committer` email address in the commit. |
        /// | `unverified_email` | The `committer` email address in the commit was associated with a user, but the email address is not verified on her/his account. |
        /// | `bad_email` | The `committer` email address in the commit is not included in the identities of the PGP key that made the signature. |
        /// | `unknown_key` | The key that made the signature has not been registered with any user's account. |
        /// | `malformed_signature` | There was an error parsing the signature. |
        /// | `invalid` | The signature could not be cryptographically verified using the key whose key-id was found in the signature. |
        /// | `valid` | None of the above errors applied, so the signature is considered to be verified. |
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/git#create-a-tag-object)
        public func post(_ body: PostRequest) -> Request<OctoKit.GitTag> {
            Request(method: "POST", url: path, body: body, id: "git/create-tag")
        }

        public enum PostResponseHeaders {
            public static let location = HTTPHeader<String>(field: "Location")
        }

        public struct PostRequest: Encodable {
            /// The tag's name. This is typically a version (e.g., "v0.0.1").
            public var tag: String
            /// The tag message.
            public var message: String
            /// The SHA of the git object this is tagging.
            public var object: String
            /// The type of the object we're tagging. Normally this is a `commit` but it can also be a `tree` or a `blob`.
            public var type: `Type`
            /// An object with information about the individual creating the tag.
            public var tagger: Tagger?

            /// The type of the object we're tagging. Normally this is a `commit` but it can also be a `tree` or a `blob`.
            public enum `Type`: String, Codable, CaseIterable {
                case commit
                case tree
                case blob
            }

            /// An object with information about the individual creating the tag.
            public struct Tagger: Encodable {
                /// The name of the author of the tag
                public var name: String
                /// The email of the author of the tag
                public var email: String
                /// When this object was tagged. This is a timestamp in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format: `YYYY-MM-DDTHH:MM:SSZ`.
                public var date: Date?

                public init(name: String, email: String, date: Date? = nil) {
                    self.name = name
                    self.email = email
                    self.date = date
                }

                public func encode(to encoder: Encoder) throws {
                    var values = encoder.container(keyedBy: StringCodingKey.self)
                    try values.encode(name, forKey: "name")
                    try values.encode(email, forKey: "email")
                    try values.encodeIfPresent(date, forKey: "date")
                }
            }

            public init(tag: String, message: String, object: String, type: `Type`, tagger: Tagger? = nil) {
                self.tag = tag
                self.message = message
                self.object = object
                self.type = type
                self.tagger = tagger
            }

            public func encode(to encoder: Encoder) throws {
                var values = encoder.container(keyedBy: StringCodingKey.self)
                try values.encode(tag, forKey: "tag")
                try values.encode(message, forKey: "message")
                try values.encode(object, forKey: "object")
                try values.encode(type, forKey: "type")
                try values.encodeIfPresent(tagger, forKey: "tagger")
            }
        }
    }
}
