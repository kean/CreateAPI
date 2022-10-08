// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.Users {
    public func username(_ username: String) -> WithUsername {
        WithUsername(path: "\(path)/\(username)")
    }

    public struct WithUsername {
        /// Path: `/users/{username}`
        public let path: String

        /// Get a user
        ///
        /// Provides publicly available information about someone with a GitHub account.
        /// 
        /// GitHub Apps with the `Plan` user permission can use this endpoint to retrieve information about a user's GitHub plan. The GitHub App must be authenticated as a user. See "[Identifying and authorizing users for GitHub Apps](https://docs.github.com/apps/building-github-apps/identifying-and-authorizing-users-for-github-apps/)" for details about authentication. For an example response, see 'Response with GitHub plan information' below"
        /// 
        /// The `email` key in the following response is the publicly visible email address from your GitHub [profile page](https://github.com/settings/profile). When setting up your profile, you can select a primary email address to be “public” which provides an email entry for this endpoint. If you do not set a public email address for `email`, then it will have a value of `null`. You only see publicly visible email addresses when authenticated with GitHub. For more information, see [Authentication](https://docs.github.com/rest/overview/resources-in-the-rest-api#authentication).
        /// 
        /// The Emails API enables you to list all of your email addresses, and toggle a primary email to be visible publicly. For more information, see "[Emails API](https://docs.github.com/rest/reference/users#emails)".
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/users#get-a-user)
        public var get: Request<GetResponse> {
            Request(path: path, method: "GET", id: "users/get-by-username")
        }

        public enum GetResponse: Decodable {
            case privateUser(OctoKit.PrivateUser)
            case publicUser(OctoKit.PublicUser)

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                if let value = try? container.decode(OctoKit.PrivateUser.self) {
                    self = .privateUser(value)
                } else if let value = try? container.decode(OctoKit.PublicUser.self) {
                    self = .publicUser(value)
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Data could not be decoded as any of the expected types (OctoKit.PrivateUser, OctoKit.PublicUser)."
                    )
                }
            }
        }
    }
}
