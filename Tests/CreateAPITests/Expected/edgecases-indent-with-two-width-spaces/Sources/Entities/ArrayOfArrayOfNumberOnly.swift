// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import NaiveDate

public struct ArrayOfArrayOfNumberOnly: Codable {
  public var arrayArrayNumber: [[Double]]?

  public init(arrayArrayNumber: [[Double]]? = nil) {
    self.arrayArrayNumber = arrayArrayNumber
  }

  public init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: StringCodingKey.self)
    self.arrayArrayNumber = try values.decodeIfPresent([[Double]].self, forKey: "ArrayArrayNumber")
  }

  public func encode(to encoder: Encoder) throws {
    var values = encoder.container(keyedBy: StringCodingKey.self)
    try values.encodeIfPresent(arrayArrayNumber, forKey: "ArrayArrayNumber")
  }
}
