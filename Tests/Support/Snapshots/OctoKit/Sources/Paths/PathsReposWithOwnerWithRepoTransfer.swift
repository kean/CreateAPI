// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.Repos.WithOwner.WithRepo {
    public var transfer: Transfer {
        Transfer(path: path + "/transfer")
    }

    public struct Transfer {
        /// Path: `/repos/{owner}/{repo}/transfer`
        public let path: String

        /// Transfer a repository
        ///
        /// A transfer request will need to be accepted by the new owner when transferring a personal repository to another user. The response will contain the original `owner`, and the transfer will continue asynchronously. For more details on the requirements to transfer personal and organization-owned repositories, see [about repository transfers](https://help.github.com/articles/about-repository-transfers/).
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/repos#transfer-a-repository)
        public func post(_ body: PostRequest) -> Request<OctoKit.MinimalRepository> {
            Request(path: path, method: "POST", body: body, id: "repos/transfer")
        }

        public struct PostRequest: Encodable {
            /// The username or organization name the repository will be transferred to.
            public var newOwner: String
            /// ID of the team or teams to add to the repository. Teams can only be added to organization-owned repositories.
            public var teamIDs: [Int]?

            public init(newOwner: String, teamIDs: [Int]? = nil) {
                self.newOwner = newOwner
                self.teamIDs = teamIDs
            }

            public func encode(to encoder: Encoder) throws {
                var values = encoder.container(keyedBy: StringCodingKey.self)
                try values.encode(newOwner, forKey: "new_owner")
                try values.encodeIfPresent(teamIDs, forKey: "team_ids")
            }
        }
    }
}
