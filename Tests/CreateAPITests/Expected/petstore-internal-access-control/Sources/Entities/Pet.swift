// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation

/// A pet title
///
/// A pet description
struct Pet: Codable {
    var id: Int
    /// Example: "Buddy"
    var name: String
    var tag: String?

    init(id: Int, name: String, tag: String? = nil) {
        self.id = id
        self.name = name
        self.tag = tag
    }
}