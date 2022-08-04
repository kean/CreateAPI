// Generated by Create API
// https://github.com/CreateAPI/CreateAPI
//
// swiftlint:disable all

import Foundation
import NaiveDate

/// Hypermedia Link with Type
public struct LinkWithType: Codable {
    public var href: String
    public var type: String

    public init(href: String, type: String) {
        self.href = href
        self.type = type
    }
}