// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import NaiveDate

/// Webhook delivery
///
/// Delivery made by a webhook.
public struct HookDelivery: Codable {
    /// Unique identifier of the delivery.
    ///
    /// Example: 42
    public var id: Int
    /// Unique identifier for the event (shared with all deliveries for all webhooks that subscribe to this event).
    ///
    /// Example: "58474f00-b361-11eb-836d-0e4f3503ccbe"
    public var guid: String
    /// Time when the delivery was delivered.
    ///
    /// Example: "2021-05-12T20:33:44Z"
    public var deliveredAt: Date
    /// Whether the delivery is a redelivery.
    ///
    /// Example: false
    public var isRedelivery: Bool
    /// Time spent delivering.
    ///
    /// Example: 0.03
    public var duration: Double
    /// Description of the status of the attempted delivery
    ///
    /// Example: "failed to connect"
    public var status: String
    /// Status code received when delivery was made.
    ///
    /// Example: 502
    public var statusCode: Int
    /// The event that triggered the delivery.
    ///
    /// Example: "issues"
    public var event: String
    /// The type of activity for the event that triggered the delivery.
    ///
    /// Example: "opened"
    public var action: String?
    /// The id of the GitHub App installation associated with this event.
    ///
    /// Example: 123
    public var installationID: Int?
    /// The id of the repository associated with this event.
    ///
    /// Example: 123
    public var repositoryID: Int?
    /// The URL target of the delivery.
    ///
    /// Example: "https://www.example.com"
    public var url: String?
    public var request: Request
    public var response: Response

    public struct Request: Codable {
        /// The request headers sent with the webhook delivery.
        public var headers: [String: AnyJSON]?
        /// The webhook payload.
        public var payload: [String: AnyJSON]?

        public init(headers: [String: AnyJSON]? = nil, payload: [String: AnyJSON]? = nil) {
            self.headers = headers
            self.payload = payload
        }
    }

    public struct Response: Codable {
        /// The response headers received when the delivery was made.
        public var headers: [String: AnyJSON]?
        /// The response payload received.
        public var payload: String?

        public init(headers: [String: AnyJSON]? = nil, payload: String? = nil) {
            self.headers = headers
            self.payload = payload
        }
    }

    public init(id: Int, guid: String, deliveredAt: Date, isRedelivery: Bool, duration: Double, status: String, statusCode: Int, event: String, action: String? = nil, installationID: Int? = nil, repositoryID: Int? = nil, url: String? = nil, request: Request, response: Response) {
        self.id = id
        self.guid = guid
        self.deliveredAt = deliveredAt
        self.isRedelivery = isRedelivery
        self.duration = duration
        self.status = status
        self.statusCode = statusCode
        self.event = event
        self.action = action
        self.installationID = installationID
        self.repositoryID = repositoryID
        self.url = url
        self.request = request
        self.response = response
    }

    private enum CodingKeys: String, CodingKey {
        case id
        case guid
        case deliveredAt = "delivered_at"
        case isRedelivery = "redelivery"
        case duration
        case status
        case statusCode = "status_code"
        case event
        case action
        case installationID = "installation_id"
        case repositoryID = "repository_id"
        case url
        case request
        case response
    }
}
