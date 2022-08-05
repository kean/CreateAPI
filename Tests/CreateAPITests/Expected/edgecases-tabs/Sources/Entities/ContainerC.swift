// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import NaiveDate

public struct ContainerC: Codable {
	public var child: Child

	public struct Child: Codable {
		public var `enum`: Enum
		public var renameMe: String

		public enum Enum: String, Codable, CaseIterable {
			case a
			case b
		}

		public init(`enum`: Enum, renameMe: String) {
			self.enum = `enum`
			self.renameMe = renameMe
		}

		private enum CodingKeys: String, CodingKey {
			case `enum`
			case renameMe = "rename-me"
		}
	}

	public init(child: Child) {
		self.child = child
	}
}
