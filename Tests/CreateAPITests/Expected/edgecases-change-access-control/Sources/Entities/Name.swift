// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import NaiveDate

/// Model for testing model name same as property name
struct Name: Codable {
    var name: Int
    var snakeCase: Int?
    var property: String?
    var _123Number: Int?

    init(name: Int, snakeCase: Int? = nil, property: String? = nil, _123Number: Int? = nil) {
        self.name = name
        self.snakeCase = snakeCase
        self.property = property
        self._123Number = _123Number
    }

    private enum CodingKeys: String, CodingKey {
        case name
        case snakeCase = "snake_case"
        case property
        case _123Number = "123Number"
    }
}
