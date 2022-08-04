// Generated by Create API
// https://github.com/CreateAPI/CreateAPI
//
// swiftlint:disable all

import Foundation
import NaiveDate

public struct StarredRepository: Codable {
    public var starredAt: Date
    /// Repository
    ///
    /// A git repository
    public var repo: Repository

    public init(starredAt: Date, repo: Repository) {
        self.starredAt = starredAt
        self.repo = repo
    }

    private enum CodingKeys: String, CodingKey {
        case starredAt = "starred_at"
        case repo
    }
}