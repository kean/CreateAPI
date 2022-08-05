// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import NaiveDate

public struct Order: Codable {
    public var id: Int?
    public var petID: Int?
    public var quantity: Int?
    public var shipDate: Date?
    /// Order Status
    public var status: Status?
    public var isComplete: Bool

    /// Order Status
    public enum Status: String, Codable, CaseIterable {
        case placed
        case approved
        case delivered
    }

    public init(id: Int? = nil, petID: Int? = nil, quantity: Int? = nil, shipDate: Date? = nil, status: Status? = nil, isComplete: Bool? = nil) {
        self.id = id
        self.petID = petID
        self.quantity = quantity
        self.shipDate = shipDate
        self.status = status
        self.isComplete = isComplete ?? false
    }

    private enum CodingKeys: String, CodingKey {
        case id
        case petID = "petId"
        case quantity
        case shipDate
        case status
        case isComplete = "complete"
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try values.decodeIfPresent(Int.self, forKey: .id)
        self.petID = try values.decodeIfPresent(Int.self, forKey: .petID)
        self.quantity = try values.decodeIfPresent(Int.self, forKey: .quantity)
        self.shipDate = try values.decodeIfPresent(Date.self, forKey: .shipDate)
        self.status = try values.decodeIfPresent(Status.self, forKey: .status)
        self.isComplete = try values.decodeIfPresent(Bool.self, forKey: .isComplete) ?? false
    }
}
