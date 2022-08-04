// Generated by Create API
// https://github.com/CreateAPI/CreateAPI
//
// swiftlint:disable all

import Foundation
import NaiveDate

public struct Contributor: Codable {
    public var login: String?
    public var id: Int?
    public var nodeID: String?
    public var avatarURL: URL?
    public var gravatarID: String?
    public var url: URL?
    public var htmlURL: URL?
    public var followersURL: URL?
    public var followingURL: String?
    public var gistsURL: String?
    public var starredURL: String?
    public var subscriptionsURL: URL?
    public var organizationsURL: URL?
    public var reposURL: URL?
    public var eventsURL: String?
    public var receivedEventsURL: URL?
    public var type: String
    public var isSiteAdmin: Bool?
    public var contributions: Int
    public var email: String?
    public var name: String?

    public init(login: String? = nil, id: Int? = nil, nodeID: String? = nil, avatarURL: URL? = nil, gravatarID: String? = nil, url: URL? = nil, htmlURL: URL? = nil, followersURL: URL? = nil, followingURL: String? = nil, gistsURL: String? = nil, starredURL: String? = nil, subscriptionsURL: URL? = nil, organizationsURL: URL? = nil, reposURL: URL? = nil, eventsURL: String? = nil, receivedEventsURL: URL? = nil, type: String, isSiteAdmin: Bool? = nil, contributions: Int, email: String? = nil, name: String? = nil) {
        self.login = login
        self.id = id
        self.nodeID = nodeID
        self.avatarURL = avatarURL
        self.gravatarID = gravatarID
        self.url = url
        self.htmlURL = htmlURL
        self.followersURL = followersURL
        self.followingURL = followingURL
        self.gistsURL = gistsURL
        self.starredURL = starredURL
        self.subscriptionsURL = subscriptionsURL
        self.organizationsURL = organizationsURL
        self.reposURL = reposURL
        self.eventsURL = eventsURL
        self.receivedEventsURL = receivedEventsURL
        self.type = type
        self.isSiteAdmin = isSiteAdmin
        self.contributions = contributions
        self.email = email
        self.name = name
    }

    private enum CodingKeys: String, CodingKey {
        case login
        case id
        case nodeID = "node_id"
        case avatarURL = "avatar_url"
        case gravatarID = "gravatar_id"
        case url
        case htmlURL = "html_url"
        case followersURL = "followers_url"
        case followingURL = "following_url"
        case gistsURL = "gists_url"
        case starredURL = "starred_url"
        case subscriptionsURL = "subscriptions_url"
        case organizationsURL = "organizations_url"
        case reposURL = "repos_url"
        case eventsURL = "events_url"
        case receivedEventsURL = "received_events_url"
        case type
        case isSiteAdmin = "site_admin"
        case contributions
        case email
        case name
    }
}