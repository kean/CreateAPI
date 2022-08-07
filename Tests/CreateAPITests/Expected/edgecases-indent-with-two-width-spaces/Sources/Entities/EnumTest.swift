// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import NaiveDate

public struct EnumTest: Codable {
  public var enumString: EnumString?
  public var enumInteger: Int?
  public var enumNumber: Double?
  public var outerEnum: OuterEnum?

  public enum EnumString: String, Codable, CaseIterable {
    case upper = "UPPER"
    case lower
    case empty = ""
  }

  public init(enumString: EnumString? = nil, enumInteger: Int? = nil, enumNumber: Double? = nil, outerEnum: OuterEnum? = nil) {
    self.enumString = enumString
    self.enumInteger = enumInteger
    self.enumNumber = enumNumber
    self.outerEnum = outerEnum
  }

  public init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: StringCodingKey.self)
    self.enumString = try values.decodeIfPresent(EnumString.self, forKey: "enum_string")
    self.enumInteger = try values.decodeIfPresent(Int.self, forKey: "enum_integer")
    self.enumNumber = try values.decodeIfPresent(Double.self, forKey: "enum_number")
    self.outerEnum = try values.decodeIfPresent(OuterEnum.self, forKey: "outerEnum")
  }

  public func encode(to encoder: Encoder) throws {
    var values = encoder.container(keyedBy: StringCodingKey.self)
    try values.encodeIfPresent(enumString, forKey: "enum_string")
    try values.encodeIfPresent(enumInteger, forKey: "enum_integer")
    try values.encodeIfPresent(enumNumber, forKey: "enum_number")
    try values.encodeIfPresent(outerEnum, forKey: "outerEnum")
  }
}
