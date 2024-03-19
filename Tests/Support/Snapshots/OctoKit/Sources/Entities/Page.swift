// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import NaiveDate

/// GitHub Pages
///
/// The configuration for GitHub Pages for a repository.
public struct Page: Codable {
    /// The API address for accessing this Page resource.
    ///
    /// Example: "https://api.github.com/repos/github/hello-world/pages"
    public var url: URL
    /// The status of the most recent build of the Page.
    ///
    /// Example: "built"
    public var status: Status?
    /// The Pages site's custom domain
    ///
    /// Example: "example.com"
    public var cname: String?
    /// The state if the domain is verified
    ///
    /// Example: "pending"
    public var protectedDomainState: ProtectedDomainState?
    /// The timestamp when a pending domain becomes unverified.
    public var pendingDomainUnverifiedAt: Date?
    /// Whether the Page has a custom 404 page.
    ///
    /// Example: false
    public var isCustom404: Bool
    /// The web address the Page can be accessed from.
    ///
    /// Example: "https://example.com"
    public var htmlURL: URL?
    /// Pages Source Hash
    public var source: PagesSourceHash?
    /// Whether the GitHub Pages site is publicly visible. If set to `true`, the site is accessible to anyone on the internet. If set to `false`, the site will only be accessible to users who have at least `read` access to the repository that published the site.
    ///
    /// Example: true
    public var isPublic: Bool
    /// Pages Https Certificate
    public var httpsCertificate: PagesHTTPSCertificate?
    /// Whether https is enabled on the domain
    ///
    /// Example: true
    public var isHTTPSEnforced: Bool?

    /// The status of the most recent build of the Page.
    ///
    /// Example: "built"
    public enum Status: String, Codable, CaseIterable {
        case built
        case building
        case errored
    }

    /// The state if the domain is verified
    ///
    /// Example: "pending"
    public enum ProtectedDomainState: String, Codable, CaseIterable {
        case pending
        case verified
        case unverified
    }

    public init(url: URL, status: Status? = nil, cname: String? = nil, protectedDomainState: ProtectedDomainState? = nil, pendingDomainUnverifiedAt: Date? = nil, isCustom404: Bool = false, htmlURL: URL? = nil, source: PagesSourceHash? = nil, isPublic: Bool, httpsCertificate: PagesHTTPSCertificate? = nil, isHTTPSEnforced: Bool? = nil) {
        self.url = url
        self.status = status
        self.cname = cname
        self.protectedDomainState = protectedDomainState
        self.pendingDomainUnverifiedAt = pendingDomainUnverifiedAt
        self.isCustom404 = isCustom404
        self.htmlURL = htmlURL
        self.source = source
        self.isPublic = isPublic
        self.httpsCertificate = httpsCertificate
        self.isHTTPSEnforced = isHTTPSEnforced
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.url = try values.decode(URL.self, forKey: "url")
        self.status = try values.decodeIfPresent(Status.self, forKey: "status")
        self.cname = try values.decodeIfPresent(String.self, forKey: "cname")
        self.protectedDomainState = try values.decodeIfPresent(ProtectedDomainState.self, forKey: "protected_domain_state")
        self.pendingDomainUnverifiedAt = try values.decodeIfPresent(Date.self, forKey: "pending_domain_unverified_at")
        self.isCustom404 = try values.decode(Bool.self, forKey: "custom_404")
        self.htmlURL = try values.decodeIfPresent(URL.self, forKey: "html_url")
        self.source = try values.decodeIfPresent(PagesSourceHash.self, forKey: "source")
        self.isPublic = try values.decode(Bool.self, forKey: "public")
        self.httpsCertificate = try values.decodeIfPresent(PagesHTTPSCertificate.self, forKey: "https_certificate")
        self.isHTTPSEnforced = try values.decodeIfPresent(Bool.self, forKey: "https_enforced")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(url, forKey: "url")
        try values.encodeIfPresent(status, forKey: "status")
        try values.encodeIfPresent(cname, forKey: "cname")
        try values.encodeIfPresent(protectedDomainState, forKey: "protected_domain_state")
        try values.encodeIfPresent(pendingDomainUnverifiedAt, forKey: "pending_domain_unverified_at")
        try values.encode(isCustom404, forKey: "custom_404")
        try values.encodeIfPresent(htmlURL, forKey: "html_url")
        try values.encodeIfPresent(source, forKey: "source")
        try values.encode(isPublic, forKey: "public")
        try values.encodeIfPresent(httpsCertificate, forKey: "https_certificate")
        try values.encodeIfPresent(isHTTPSEnforced, forKey: "https_enforced")
    }
}
