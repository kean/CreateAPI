// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import NaiveDate

public struct ContentDirectoryItem: Codable {
    public var type: String
    public var size: Int
    public var name: String
    public var path: String
    public var content: String?
    public var sha: String
    public var url: URL
    public var gitURL: URL?
    public var htmlURL: URL?
    public var downloadURL: URL?
    public var links: Links

    public struct Links: Codable {
        public var git: URL?
        public var html: URL?
        public var this: URL

        public init(git: URL? = nil, html: URL? = nil, this: URL) {
            self.git = git
            self.html = html
            self.this = this
        }

        public init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: StringCodingKey.self)
            self.git = try values.decodeIfPresent(URL.self, forKey: "git")
            self.html = try values.decodeIfPresent(URL.self, forKey: "html")
            self.this = try values.decode(URL.self, forKey: "self")
        }

        public func encode(to encoder: Encoder) throws {
            var values = encoder.container(keyedBy: StringCodingKey.self)
            try values.encodeIfPresent(git, forKey: "git")
            try values.encodeIfPresent(html, forKey: "html")
            try values.encode(this, forKey: "self")
        }
    }

    public init(type: String, size: Int, name: String, path: String, content: String? = nil, sha: String, url: URL, gitURL: URL? = nil, htmlURL: URL? = nil, downloadURL: URL? = nil, links: Links) {
        self.type = type
        self.size = size
        self.name = name
        self.path = path
        self.content = content
        self.sha = sha
        self.url = url
        self.gitURL = gitURL
        self.htmlURL = htmlURL
        self.downloadURL = downloadURL
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.type = try values.decode(String.self, forKey: "type")
        self.size = try values.decode(Int.self, forKey: "size")
        self.name = try values.decode(String.self, forKey: "name")
        self.path = try values.decode(String.self, forKey: "path")
        self.content = try values.decodeIfPresent(String.self, forKey: "content")
        self.sha = try values.decode(String.self, forKey: "sha")
        self.url = try values.decode(URL.self, forKey: "url")
        self.gitURL = try values.decodeIfPresent(URL.self, forKey: "git_url")
        self.htmlURL = try values.decodeIfPresent(URL.self, forKey: "html_url")
        self.downloadURL = try values.decodeIfPresent(URL.self, forKey: "download_url")
        self.links = try values.decode(Links.self, forKey: "_links")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(type, forKey: "type")
        try values.encode(size, forKey: "size")
        try values.encode(name, forKey: "name")
        try values.encode(path, forKey: "path")
        try values.encodeIfPresent(content, forKey: "content")
        try values.encode(sha, forKey: "sha")
        try values.encode(url, forKey: "url")
        try values.encodeIfPresent(gitURL, forKey: "git_url")
        try values.encodeIfPresent(htmlURL, forKey: "html_url")
        try values.encodeIfPresent(downloadURL, forKey: "download_url")
        try values.encode(links, forKey: "_links")
    }
}
