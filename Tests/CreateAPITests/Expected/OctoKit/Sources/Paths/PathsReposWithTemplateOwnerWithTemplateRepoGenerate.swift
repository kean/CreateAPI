// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.Repos.WithTemplateOwner.WithTemplateRepo {
    public var generate: Generate {
        Generate(path: path + "/generate")
    }

    public struct Generate {
        /// Path: `/repos/{template_owner}/{template_repo}/generate`
        public let path: String

        /// Create a repository using a template
        ///
        /// Creates a new repository using a repository template. Use the `template_owner` and `template_repo` route parameters to specify the repository to use as the template. The authenticated user must own or be a member of an organization that owns the repository. To check if a repository is available to use as a template, get the repository's information using the [Get a repository](https://docs.github.com/rest/reference/repos#get-a-repository) endpoint and check that the `is_template` key is `true`.
        /// 
        /// **OAuth scope requirements**
        /// 
        /// When using [OAuth](https://docs.github.com/apps/building-oauth-apps/understanding-scopes-for-oauth-apps/), authorizations must include:
        /// 
        /// *   `public_repo` scope or `repo` scope to create a public repository. Note: For GitHub AE, use `repo` scope to create an internal repository.
        /// *   `repo` scope to create a private repository
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/repos#create-a-repository-using-a-template)
        public func post(_ body: PostRequest) -> Request<OctoKit.Repository> {
            Request(method: "POST", url: path, body: body, id: "repos/create-using-template")
        }

        public enum PostResponseHeaders {
            public static let location = HTTPHeader<String>(field: "Location")
        }

        public struct PostRequest: Encodable {
            /// The organization or person who will own the new repository. To create a new repository in an organization, the authenticated user must be a member of the specified organization.
            public var owner: String?
            /// The name of the new repository.
            public var name: String
            /// A short description of the new repository.
            public var description: String?
            /// Set to `true` to include the directory structure and files from all branches in the template repository, and not just the default branch. Default: `false`.
            public var isIncludeAllBranches: Bool
            /// Either `true` to create a new private repository or `false` to create a new public one.
            public var isPrivate: Bool

            public init(owner: String? = nil, name: String, description: String? = nil, isIncludeAllBranches: Bool? = nil, isPrivate: Bool? = nil) {
                self.owner = owner
                self.name = name
                self.description = description
                self.isIncludeAllBranches = isIncludeAllBranches ?? false
                self.isPrivate = isPrivate ?? false
            }

            public func encode(to encoder: Encoder) throws {
                var values = encoder.container(keyedBy: StringCodingKey.self)
                try values.encodeIfPresent(owner, forKey: "owner")
                try values.encode(name, forKey: "name")
                try values.encodeIfPresent(description, forKey: "description")
                try values.encodeIfPresent(isIncludeAllBranches, forKey: "include_all_branches")
                try values.encodeIfPresent(isPrivate, forKey: "private")
            }
        }
    }
}
