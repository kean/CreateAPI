// Generated by Create API
// https://github.com/CreateAPI/CreateAPI
//
// swiftlint:disable all

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.Repos.WithOwner.WithRepo.SecretScanning {
    public var alerts: Alerts {
        Alerts(path: path + "/alerts")
    }

    public struct Alerts {
        /// Path: `/repos/{owner}/{repo}/secret-scanning/alerts`
        public let path: String

        /// List secret scanning alerts for a repository
        ///
        /// Lists secret scanning alerts for a private repository, from newest to oldest. To use this endpoint, you must be an administrator for the repository or organization, and you must use an access token with the `repo` scope or `security_events` scope.
        /// 
        /// GitHub Apps must have the `secret_scanning_alerts` read permission to use this endpoint.
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/secret-scanning#list-secret-scanning-alerts-for-a-repository)
        public func get(parameters: GetParameters? = nil) -> Request<[OctoKit.SecretScanningAlert]> {
            Request(method: "GET", url: path, query: parameters?.asQuery)
        }

        public struct GetParameters {
            public var state: State?
            public var secretType: String?
            public var resolution: String?
            public var page: Int?
            public var perPage: Int?

            public enum State: String, Codable, CaseIterable {
                case `open`
                case resolved
            }

            public init(state: State? = nil, secretType: String? = nil, resolution: String? = nil, page: Int? = nil, perPage: Int? = nil) {
                self.state = state
                self.secretType = secretType
                self.resolution = resolution
                self.page = page
                self.perPage = perPage
            }

            public var asQuery: [(String, String?)] {
                let encoder = URLQueryEncoder()
                encoder.encode(state, forKey: "state")
                encoder.encode(secretType, forKey: "secret_type")
                encoder.encode(resolution, forKey: "resolution")
                encoder.encode(page, forKey: "page")
                encoder.encode(perPage, forKey: "per_page")
                return encoder.items
            }
        }
    }
}