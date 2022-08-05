// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import NaiveDate

public struct MixedPropertiesAndAdditionalPropertiesClass: Codable {
	public var uuid: UUID?
	public var dateTime: Date?
	public var map: [String: Animal]?

	public init(uuid: UUID? = nil, dateTime: Date? = nil, map: [String: Animal]? = nil) {
		self.uuid = uuid
		self.dateTime = dateTime
		self.map = map
	}
}
