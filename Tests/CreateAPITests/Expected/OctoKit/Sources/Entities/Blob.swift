// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import NaiveDate

public struct Blob: Codable {
    public var content: String
    public var encoding: String
    public var url: URL
    public var sha: String
    public var size: Int?
    public var nodeID: String
    public var highlightedContent: String?

    public init(content: String, encoding: String, url: URL, sha: String, size: Int? = nil, nodeID: String, highlightedContent: String? = nil) {
        self.content = content
        self.encoding = encoding
        self.url = url
        self.sha = sha
        self.size = size
        self.nodeID = nodeID
        self.highlightedContent = highlightedContent
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.content = try values.decode(String.self, forKey: "content")
        self.encoding = try values.decode(String.self, forKey: "encoding")
        self.url = try values.decode(URL.self, forKey: "url")
        self.sha = try values.decode(String.self, forKey: "sha")
        self.size = try values.decodeIfPresent(Int.self, forKey: "size")
        self.nodeID = try values.decode(String.self, forKey: "node_id")
        self.highlightedContent = try values.decodeIfPresent(String.self, forKey: "highlighted_content")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(content, forKey: "content")
        try values.encode(encoding, forKey: "encoding")
        try values.encode(url, forKey: "url")
        try values.encode(sha, forKey: "sha")
        try values.encodeIfPresent(size, forKey: "size")
        try values.encode(nodeID, forKey: "node_id")
        try values.encodeIfPresent(highlightedContent, forKey: "highlighted_content")
    }
}
