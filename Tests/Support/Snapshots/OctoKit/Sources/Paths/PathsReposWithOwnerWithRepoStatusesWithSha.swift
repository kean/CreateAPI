// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.Repos.WithOwner.WithRepo.Statuses {
    public func sha(_ sha: String) -> WithSha {
        WithSha(path: "\(path)/\(sha)")
    }

    public struct WithSha {
        /// Path: `/repos/{owner}/{repo}/statuses/{sha}`
        public let path: String

        /// Create a commit status
        ///
        /// Users with push access in a repository can create commit statuses for a given SHA.
        /// 
        /// Note: there is a limit of 1000 statuses per `sha` and `context` within a repository. Attempts to create more than 1000 statuses will result in a validation error.
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/repos#create-a-commit-status)
        public func post(_ body: PostRequest) -> Request<OctoKit.Status> {
            Request(path: path, method: "POST", body: body, id: "repos/create-commit-status")
        }

        public enum PostResponseHeaders {
            public static let location = HTTPHeader<String>(field: "Location")
        }

        public struct PostRequest: Encodable {
            /// The state of the status. Can be one of `error`, `failure`, `pending`, or `success`.
            public var state: State
            /// The target URL to associate with this status. This URL will be linked from the GitHub UI to allow users to easily see the source of the status.  
            /// For example, if your continuous integration system is posting build status, you would want to provide the deep link for the build output for this specific SHA:  
            /// `http://ci.example.com/user/repo/build/sha`
            public var targetURL: String?
            /// A short description of the status.
            public var description: String?
            /// A string label to differentiate this status from the status of other systems. This field is case-insensitive.
            public var context: String?

            /// The state of the status. Can be one of `error`, `failure`, `pending`, or `success`.
            public enum State: String, Codable, CaseIterable {
                case error
                case failure
                case pending
                case success
            }

            public init(state: State, targetURL: String? = nil, description: String? = nil, context: String? = nil) {
                self.state = state
                self.targetURL = targetURL
                self.description = description
                self.context = context
            }

            public func encode(to encoder: Encoder) throws {
                var values = encoder.container(keyedBy: StringCodingKey.self)
                try values.encode(state, forKey: "state")
                try values.encodeIfPresent(targetURL, forKey: "target_url")
                try values.encodeIfPresent(description, forKey: "description")
                try values.encodeIfPresent(context, forKey: "context")
            }
        }
    }
}
