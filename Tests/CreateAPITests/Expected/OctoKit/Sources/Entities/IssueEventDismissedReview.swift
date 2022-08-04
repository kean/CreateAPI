// Generated by Create API
// https://github.com/CreateAPI/CreateAPI
//
// swiftlint:disable all

import Foundation
import NaiveDate

public struct IssueEventDismissedReview: Codable {
    public var state: String
    public var reviewID: Int
    public var dismissalMessage: String?
    public var dismissalCommitID: String?

    public init(state: String, reviewID: Int, dismissalMessage: String? = nil, dismissalCommitID: String? = nil) {
        self.state = state
        self.reviewID = reviewID
        self.dismissalMessage = dismissalMessage
        self.dismissalCommitID = dismissalCommitID
    }

    private enum CodingKeys: String, CodingKey {
        case state
        case reviewID = "review_id"
        case dismissalMessage = "dismissal_message"
        case dismissalCommitID = "dismissal_commit_id"
    }
}