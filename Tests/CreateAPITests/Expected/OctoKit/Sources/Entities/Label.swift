// Generated by Create API
// https://github.com/CreateAPI/CreateAPI
//
// swiftlint:disable all

import Foundation
import NaiveDate

/// Color-coded labels help you categorize and filter your issues (just like labels in Gmail).
public struct Label: Codable {
    /// Example: 208045946
    public var id: Int
    /// Example: "MDU6TGFiZWwyMDgwNDU5NDY="
    public var nodeID: String
    /// URL for the label
    ///
    /// Example: "https://api.github.com/repositories/42/labels/bug"
    public var url: URL
    /// The name of the label.
    ///
    /// Example: "bug"
    public var name: String
    /// Example: "Something isn't working"
    public var description: String?
    /// 6-character hex code, without the leading #, identifying the color
    ///
    /// Example: "FFFFFF"
    public var color: String
    /// Example: true
    public var isDefault: Bool

    public init(id: Int, nodeID: String, url: URL, name: String, description: String? = nil, color: String, isDefault: Bool) {
        self.id = id
        self.nodeID = nodeID
        self.url = url
        self.name = name
        self.description = description
        self.color = color
        self.isDefault = isDefault
    }

    private enum CodingKeys: String, CodingKey {
        case id
        case nodeID = "node_id"
        case url
        case name
        case description
        case color
        case isDefault = "default"
    }
}