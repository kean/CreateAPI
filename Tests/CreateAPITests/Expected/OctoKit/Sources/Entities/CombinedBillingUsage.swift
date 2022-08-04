// Generated by Create API
// https://github.com/CreateAPI/CreateAPI
//
// swiftlint:disable all

import Foundation
import NaiveDate

public struct CombinedBillingUsage: Codable {
    /// Numbers of days left in billing cycle.
    public var daysLeftInBillingCycle: Int
    /// Estimated storage space (GB) used in billing cycle.
    public var estimatedPaidStorageForMonth: Int
    /// Estimated sum of free and paid storage space (GB) used in billing cycle.
    public var estimatedStorageForMonth: Int

    public init(daysLeftInBillingCycle: Int, estimatedPaidStorageForMonth: Int, estimatedStorageForMonth: Int) {
        self.daysLeftInBillingCycle = daysLeftInBillingCycle
        self.estimatedPaidStorageForMonth = estimatedPaidStorageForMonth
        self.estimatedStorageForMonth = estimatedStorageForMonth
    }

    private enum CodingKeys: String, CodingKey {
        case daysLeftInBillingCycle = "days_left_in_billing_cycle"
        case estimatedPaidStorageForMonth = "estimated_paid_storage_for_month"
        case estimatedStorageForMonth = "estimated_storage_for_month"
    }
}