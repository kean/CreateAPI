// Generated by Create API
// https://github.com/CreateAPI/CreateAPI
//
// swiftlint:disable all

import Foundation
import NaiveDate

/// Results of a successful merge upstream request
public struct MergedUpstream: Codable {
    public var message: String?
    public var mergeType: MergeType?
    public var baseBranch: String?

    public enum MergeType: String, Codable, CaseIterable {
        case merge
        case fastForward = "fast-forward"
        case `none`
    }

    public init(message: String? = nil, mergeType: MergeType? = nil, baseBranch: String? = nil) {
        self.message = message
        self.mergeType = mergeType
        self.baseBranch = baseBranch
    }

    private enum CodingKeys: String, CodingKey {
        case message
        case mergeType = "merge_type"
        case baseBranch = "base_branch"
    }
}