// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.Repos.WithOwner.WithRepo.Actions.Runners.WithRunnerID.Labels {
    public func name(_ name: String) -> WithName {
        WithName(path: "\(path)/\(name)")
    }

    public struct WithName {
        /// Path: `/repos/{owner}/{repo}/actions/runners/{runner_id}/labels/{name}`
        public let path: String

        /// Remove a custom label from a self-hosted runner for a repository
        ///
        /// Remove a custom label from a self-hosted runner configured
        /// in a repository. Returns the remaining labels from the runner.
        /// 
        /// This endpoint returns a `404 Not Found` status if the custom label is not
        /// present on the runner.
        /// 
        /// You must authenticate using an access token with the `repo` scope to use this
        /// endpoint.
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/actions#remove-a-custom-label-from-a-self-hosted-runner-for-a-repository)
        public var delete: Request<DeleteResponse> {
            Request(method: "DELETE", url: path, id: "actions/remove-custom-label-from-self-hosted-runner-for-repo")
        }

        public struct DeleteResponse: Decodable {
            public var totalCount: Int
            public var labels: [OctoKit.RunnerLabel]

            public init(totalCount: Int, labels: [OctoKit.RunnerLabel]) {
                self.totalCount = totalCount
                self.labels = labels
            }

            public init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: StringCodingKey.self)
                self.totalCount = try values.decode(Int.self, forKey: "total_count")
                self.labels = try values.decode([OctoKit.RunnerLabel].self, forKey: "labels")
            }
        }
    }
}
