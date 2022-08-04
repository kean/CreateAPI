// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import NaiveDate

public struct CommitActivity: Codable {
    /// Example: [0, 3, 26, 20, 39, 1, 0]
    public var days: [Int]
    /// Example: 89
    public var total: Int
    /// Example: 1336280400
    public var week: Int

    public init(days: [Int], total: Int, week: Int) {
        self.days = days
        self.total = total
        self.week = week
    }
}
