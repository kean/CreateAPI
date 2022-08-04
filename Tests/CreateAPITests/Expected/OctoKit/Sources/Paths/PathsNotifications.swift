// Generated by Create API
// https://github.com/CreateAPI/CreateAPI
//
// swiftlint:disable all

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths {
    public static var notifications: Notifications {
        Notifications(path: "/notifications")
    }

    public struct Notifications {
        /// Path: `/notifications`
        public let path: String

        /// List notifications for the authenticated user
        ///
        /// List all notifications for the current user, sorted by most recently updated.
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/activity#list-notifications-for-the-authenticated-user)
        public func get(parameters: GetParameters? = nil) -> Request<[OctoKit.Thread]> {
            Request(method: "GET", url: path, query: parameters?.asQuery, id: "activity/list-notifications-for-authenticated-user")
        }

        public enum GetResponseHeaders {
            public static let link = HTTPHeader<String>(field: "Link")
        }

        public struct GetParameters {
            public var isAll: Bool?
            public var isParticipating: Bool?
            public var since: Date?
            public var before: Date?
            public var perPage: Int?
            public var page: Int?

            public init(isAll: Bool? = nil, isParticipating: Bool? = nil, since: Date? = nil, before: Date? = nil, perPage: Int? = nil, page: Int? = nil) {
                self.isAll = isAll
                self.isParticipating = isParticipating
                self.since = since
                self.before = before
                self.perPage = perPage
                self.page = page
            }

            public var asQuery: [(String, String?)] {
                let encoder = URLQueryEncoder()
                encoder.encode(isAll, forKey: "all")
                encoder.encode(isParticipating, forKey: "participating")
                encoder.encode(since, forKey: "since")
                encoder.encode(before, forKey: "before")
                encoder.encode(perPage, forKey: "per_page")
                encoder.encode(page, forKey: "page")
                return encoder.items
            }
        }

        /// Mark notifications as read
        ///
        /// Marks all notifications as "read" removes it from the [default view on GitHub](https://github.com/notifications). If the number of notifications is too large to complete in one request, you will receive a `202 Accepted` status and GitHub will run an asynchronous process to mark notifications as "read." To check whether any "unread" notifications remain, you can use the [List notifications for the authenticated user](https://docs.github.com/rest/reference/activity#list-notifications-for-the-authenticated-user) endpoint and pass the query parameter `all=false`.
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/activity#mark-notifications-as-read)
        public func put(_ body: PutRequest? = nil) -> Request<PutResponse> {
            Request(method: "PUT", url: path, body: body, id: "activity/mark-notifications-as-read")
        }

        public struct PutResponse: Decodable {
            public var message: String?

            public init(message: String? = nil) {
                self.message = message
            }
        }

        public struct PutRequest: Encodable {
            /// Describes the last point that notifications were checked.
            public var lastReadAt: Date?
            /// Whether the notification has been read.
            public var isRead: Bool?

            public init(lastReadAt: Date? = nil, isRead: Bool? = nil) {
                self.lastReadAt = lastReadAt
                self.isRead = isRead
            }

            private enum CodingKeys: String, CodingKey {
                case lastReadAt = "last_read_at"
                case isRead = "read"
            }
        }
    }
}
