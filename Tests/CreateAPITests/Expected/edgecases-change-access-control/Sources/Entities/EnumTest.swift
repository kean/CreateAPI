// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import NaiveDate

struct EnumTest: Codable {
    var enumString: EnumString?
    var enumInteger: Int?
    var enumNumber: Double?
    var outerEnum: OuterEnum?

    enum EnumString: String, Codable, CaseIterable {
        case upper = "UPPER"
        case lower
        case empty = ""
    }

    init(enumString: EnumString? = nil, enumInteger: Int? = nil, enumNumber: Double? = nil, outerEnum: OuterEnum? = nil) {
        self.enumString = enumString
        self.enumInteger = enumInteger
        self.enumNumber = enumNumber
        self.outerEnum = outerEnum
    }

    private enum CodingKeys: String, CodingKey {
        case enumString = "enum_string"
        case enumInteger = "enum_integer"
        case enumNumber = "enum_number"
        case outerEnum
    }
}
