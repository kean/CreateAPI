// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.Repos.WithOwner.WithRepo.Releases.WithReleaseID {
    public var reactions: Reactions {
        Reactions(path: path + "/reactions")
    }

    public struct Reactions {
        /// Path: `/repos/{owner}/{repo}/releases/{release_id}/reactions`
        public let path: String

        /// Create reaction for a release
        ///
        /// Create a reaction to a [release](https://docs.github.com/rest/reference/repos#releases). A response with a `Status: 200 OK` means that you already added the reaction type to this release.
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/reactions/#create-reaction-for-a-release)
        public func post(content: PostRequest.Content) -> Request<OctoKit.Reaction> {
            Request(method: "POST", url: path, body: PostRequest(content: content), id: "reactions/create-for-release")
        }

        public struct PostRequest: Encodable {
            /// The [reaction type](https://docs.github.com/rest/reference/reactions#reaction-types) to add to the release.
            public var content: Content

            /// The [reaction type](https://docs.github.com/rest/reference/reactions#reaction-types) to add to the release.
            public enum Content: String, Codable, CaseIterable {
                case plus1 = "+1"
                case laugh
                case heart
                case hooray
                case rocket
                case eyes
            }

            public init(content: Content) {
                self.content = content
            }
        }
    }
}
