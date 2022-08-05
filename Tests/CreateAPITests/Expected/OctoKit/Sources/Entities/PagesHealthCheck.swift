// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import NaiveDate

/// Pages Health Check Status
public struct PagesHealthCheck: Codable {
    public var domain: Domain?
    public var altDomain: AltDomain?

    public struct Domain: Codable {
        public var host: String?
        public var uri: String?
        public var nameservers: String?
        public var dnsResolves: Bool?
        public var isProxied: Bool?
        public var isCloudflareIp: Bool?
        public var isFastlyIp: Bool?
        public var isOldIpAddress: Bool?
        public var isARecord: Bool?
        public var hasCnameRecord: Bool?
        public var hasMxRecordsPresent: Bool?
        public var isValidDomain: Bool?
        public var isApexDomain: Bool?
        public var shouldBeARecord: Bool?
        public var isCnameToGithubUserDomain: Bool?
        public var isCnameToPagesDotGithubDotCom: Bool?
        public var isCnameToFastly: Bool?
        public var isPointedToGithubPagesIp: Bool?
        public var isNonGithubPagesIpPresent: Bool?
        public var isPagesDomain: Bool?
        public var isServedByPages: Bool?
        public var isValid: Bool?
        public var reason: String?
        public var respondsToHTTPS: Bool?
        public var enforcesHTTPS: Bool?
        public var httpsError: String?
        public var isHTTPSEligible: Bool?
        public var caaError: String?

        public init(host: String? = nil, uri: String? = nil, nameservers: String? = nil, dnsResolves: Bool? = nil, isProxied: Bool? = nil, isCloudflareIp: Bool? = nil, isFastlyIp: Bool? = nil, isOldIpAddress: Bool? = nil, isARecord: Bool? = nil, hasCnameRecord: Bool? = nil, hasMxRecordsPresent: Bool? = nil, isValidDomain: Bool? = nil, isApexDomain: Bool? = nil, shouldBeARecord: Bool? = nil, isCnameToGithubUserDomain: Bool? = nil, isCnameToPagesDotGithubDotCom: Bool? = nil, isCnameToFastly: Bool? = nil, isPointedToGithubPagesIp: Bool? = nil, isNonGithubPagesIpPresent: Bool? = nil, isPagesDomain: Bool? = nil, isServedByPages: Bool? = nil, isValid: Bool? = nil, reason: String? = nil, respondsToHTTPS: Bool? = nil, enforcesHTTPS: Bool? = nil, httpsError: String? = nil, isHTTPSEligible: Bool? = nil, caaError: String? = nil) {
            self.host = host
            self.uri = uri
            self.nameservers = nameservers
            self.dnsResolves = dnsResolves
            self.isProxied = isProxied
            self.isCloudflareIp = isCloudflareIp
            self.isFastlyIp = isFastlyIp
            self.isOldIpAddress = isOldIpAddress
            self.isARecord = isARecord
            self.hasCnameRecord = hasCnameRecord
            self.hasMxRecordsPresent = hasMxRecordsPresent
            self.isValidDomain = isValidDomain
            self.isApexDomain = isApexDomain
            self.shouldBeARecord = shouldBeARecord
            self.isCnameToGithubUserDomain = isCnameToGithubUserDomain
            self.isCnameToPagesDotGithubDotCom = isCnameToPagesDotGithubDotCom
            self.isCnameToFastly = isCnameToFastly
            self.isPointedToGithubPagesIp = isPointedToGithubPagesIp
            self.isNonGithubPagesIpPresent = isNonGithubPagesIpPresent
            self.isPagesDomain = isPagesDomain
            self.isServedByPages = isServedByPages
            self.isValid = isValid
            self.reason = reason
            self.respondsToHTTPS = respondsToHTTPS
            self.enforcesHTTPS = enforcesHTTPS
            self.httpsError = httpsError
            self.isHTTPSEligible = isHTTPSEligible
            self.caaError = caaError
        }

        public init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: StringCodingKey.self)
            self.host = try values.decodeIfPresent(String.self, forKey: "host")
            self.uri = try values.decodeIfPresent(String.self, forKey: "uri")
            self.nameservers = try values.decodeIfPresent(String.self, forKey: "nameservers")
            self.dnsResolves = try values.decodeIfPresent(Bool.self, forKey: "dns_resolves")
            self.isProxied = try values.decodeIfPresent(Bool.self, forKey: "is_proxied")
            self.isCloudflareIp = try values.decodeIfPresent(Bool.self, forKey: "is_cloudflare_ip")
            self.isFastlyIp = try values.decodeIfPresent(Bool.self, forKey: "is_fastly_ip")
            self.isOldIpAddress = try values.decodeIfPresent(Bool.self, forKey: "is_old_ip_address")
            self.isARecord = try values.decodeIfPresent(Bool.self, forKey: "is_a_record")
            self.hasCnameRecord = try values.decodeIfPresent(Bool.self, forKey: "has_cname_record")
            self.hasMxRecordsPresent = try values.decodeIfPresent(Bool.self, forKey: "has_mx_records_present")
            self.isValidDomain = try values.decodeIfPresent(Bool.self, forKey: "is_valid_domain")
            self.isApexDomain = try values.decodeIfPresent(Bool.self, forKey: "is_apex_domain")
            self.shouldBeARecord = try values.decodeIfPresent(Bool.self, forKey: "should_be_a_record")
            self.isCnameToGithubUserDomain = try values.decodeIfPresent(Bool.self, forKey: "is_cname_to_github_user_domain")
            self.isCnameToPagesDotGithubDotCom = try values.decodeIfPresent(Bool.self, forKey: "is_cname_to_pages_dot_github_dot_com")
            self.isCnameToFastly = try values.decodeIfPresent(Bool.self, forKey: "is_cname_to_fastly")
            self.isPointedToGithubPagesIp = try values.decodeIfPresent(Bool.self, forKey: "is_pointed_to_github_pages_ip")
            self.isNonGithubPagesIpPresent = try values.decodeIfPresent(Bool.self, forKey: "is_non_github_pages_ip_present")
            self.isPagesDomain = try values.decodeIfPresent(Bool.self, forKey: "is_pages_domain")
            self.isServedByPages = try values.decodeIfPresent(Bool.self, forKey: "is_served_by_pages")
            self.isValid = try values.decodeIfPresent(Bool.self, forKey: "is_valid")
            self.reason = try values.decodeIfPresent(String.self, forKey: "reason")
            self.respondsToHTTPS = try values.decodeIfPresent(Bool.self, forKey: "responds_to_https")
            self.enforcesHTTPS = try values.decodeIfPresent(Bool.self, forKey: "enforces_https")
            self.httpsError = try values.decodeIfPresent(String.self, forKey: "https_error")
            self.isHTTPSEligible = try values.decodeIfPresent(Bool.self, forKey: "is_https_eligible")
            self.caaError = try values.decodeIfPresent(String.self, forKey: "caa_error")
        }

        public func encode(to encoder: Encoder) throws {
            var values = encoder.container(keyedBy: StringCodingKey.self)
            try values.encodeIfPresent(host, forKey: "host")
            try values.encodeIfPresent(uri, forKey: "uri")
            try values.encodeIfPresent(nameservers, forKey: "nameservers")
            try values.encodeIfPresent(dnsResolves, forKey: "dns_resolves")
            try values.encodeIfPresent(isProxied, forKey: "is_proxied")
            try values.encodeIfPresent(isCloudflareIp, forKey: "is_cloudflare_ip")
            try values.encodeIfPresent(isFastlyIp, forKey: "is_fastly_ip")
            try values.encodeIfPresent(isOldIpAddress, forKey: "is_old_ip_address")
            try values.encodeIfPresent(isARecord, forKey: "is_a_record")
            try values.encodeIfPresent(hasCnameRecord, forKey: "has_cname_record")
            try values.encodeIfPresent(hasMxRecordsPresent, forKey: "has_mx_records_present")
            try values.encodeIfPresent(isValidDomain, forKey: "is_valid_domain")
            try values.encodeIfPresent(isApexDomain, forKey: "is_apex_domain")
            try values.encodeIfPresent(shouldBeARecord, forKey: "should_be_a_record")
            try values.encodeIfPresent(isCnameToGithubUserDomain, forKey: "is_cname_to_github_user_domain")
            try values.encodeIfPresent(isCnameToPagesDotGithubDotCom, forKey: "is_cname_to_pages_dot_github_dot_com")
            try values.encodeIfPresent(isCnameToFastly, forKey: "is_cname_to_fastly")
            try values.encodeIfPresent(isPointedToGithubPagesIp, forKey: "is_pointed_to_github_pages_ip")
            try values.encodeIfPresent(isNonGithubPagesIpPresent, forKey: "is_non_github_pages_ip_present")
            try values.encodeIfPresent(isPagesDomain, forKey: "is_pages_domain")
            try values.encodeIfPresent(isServedByPages, forKey: "is_served_by_pages")
            try values.encodeIfPresent(isValid, forKey: "is_valid")
            try values.encodeIfPresent(reason, forKey: "reason")
            try values.encodeIfPresent(respondsToHTTPS, forKey: "responds_to_https")
            try values.encodeIfPresent(enforcesHTTPS, forKey: "enforces_https")
            try values.encodeIfPresent(httpsError, forKey: "https_error")
            try values.encodeIfPresent(isHTTPSEligible, forKey: "is_https_eligible")
            try values.encodeIfPresent(caaError, forKey: "caa_error")
        }
    }

    public struct AltDomain: Codable {
        public var host: String?
        public var uri: String?
        public var nameservers: String?
        public var dnsResolves: Bool?
        public var isProxied: Bool?
        public var isCloudflareIp: Bool?
        public var isFastlyIp: Bool?
        public var isOldIpAddress: Bool?
        public var isARecord: Bool?
        public var hasCnameRecord: Bool?
        public var hasMxRecordsPresent: Bool?
        public var isValidDomain: Bool?
        public var isApexDomain: Bool?
        public var shouldBeARecord: Bool?
        public var isCnameToGithubUserDomain: Bool?
        public var isCnameToPagesDotGithubDotCom: Bool?
        public var isCnameToFastly: Bool?
        public var isPointedToGithubPagesIp: Bool?
        public var isNonGithubPagesIpPresent: Bool?
        public var isPagesDomain: Bool?
        public var isServedByPages: Bool?
        public var isValid: Bool?
        public var reason: String?
        public var respondsToHTTPS: Bool?
        public var enforcesHTTPS: Bool?
        public var httpsError: String?
        public var isHTTPSEligible: Bool?
        public var caaError: String?

        public init(host: String? = nil, uri: String? = nil, nameservers: String? = nil, dnsResolves: Bool? = nil, isProxied: Bool? = nil, isCloudflareIp: Bool? = nil, isFastlyIp: Bool? = nil, isOldIpAddress: Bool? = nil, isARecord: Bool? = nil, hasCnameRecord: Bool? = nil, hasMxRecordsPresent: Bool? = nil, isValidDomain: Bool? = nil, isApexDomain: Bool? = nil, shouldBeARecord: Bool? = nil, isCnameToGithubUserDomain: Bool? = nil, isCnameToPagesDotGithubDotCom: Bool? = nil, isCnameToFastly: Bool? = nil, isPointedToGithubPagesIp: Bool? = nil, isNonGithubPagesIpPresent: Bool? = nil, isPagesDomain: Bool? = nil, isServedByPages: Bool? = nil, isValid: Bool? = nil, reason: String? = nil, respondsToHTTPS: Bool? = nil, enforcesHTTPS: Bool? = nil, httpsError: String? = nil, isHTTPSEligible: Bool? = nil, caaError: String? = nil) {
            self.host = host
            self.uri = uri
            self.nameservers = nameservers
            self.dnsResolves = dnsResolves
            self.isProxied = isProxied
            self.isCloudflareIp = isCloudflareIp
            self.isFastlyIp = isFastlyIp
            self.isOldIpAddress = isOldIpAddress
            self.isARecord = isARecord
            self.hasCnameRecord = hasCnameRecord
            self.hasMxRecordsPresent = hasMxRecordsPresent
            self.isValidDomain = isValidDomain
            self.isApexDomain = isApexDomain
            self.shouldBeARecord = shouldBeARecord
            self.isCnameToGithubUserDomain = isCnameToGithubUserDomain
            self.isCnameToPagesDotGithubDotCom = isCnameToPagesDotGithubDotCom
            self.isCnameToFastly = isCnameToFastly
            self.isPointedToGithubPagesIp = isPointedToGithubPagesIp
            self.isNonGithubPagesIpPresent = isNonGithubPagesIpPresent
            self.isPagesDomain = isPagesDomain
            self.isServedByPages = isServedByPages
            self.isValid = isValid
            self.reason = reason
            self.respondsToHTTPS = respondsToHTTPS
            self.enforcesHTTPS = enforcesHTTPS
            self.httpsError = httpsError
            self.isHTTPSEligible = isHTTPSEligible
            self.caaError = caaError
        }

        public init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: StringCodingKey.self)
            self.host = try values.decodeIfPresent(String.self, forKey: "host")
            self.uri = try values.decodeIfPresent(String.self, forKey: "uri")
            self.nameservers = try values.decodeIfPresent(String.self, forKey: "nameservers")
            self.dnsResolves = try values.decodeIfPresent(Bool.self, forKey: "dns_resolves")
            self.isProxied = try values.decodeIfPresent(Bool.self, forKey: "is_proxied")
            self.isCloudflareIp = try values.decodeIfPresent(Bool.self, forKey: "is_cloudflare_ip")
            self.isFastlyIp = try values.decodeIfPresent(Bool.self, forKey: "is_fastly_ip")
            self.isOldIpAddress = try values.decodeIfPresent(Bool.self, forKey: "is_old_ip_address")
            self.isARecord = try values.decodeIfPresent(Bool.self, forKey: "is_a_record")
            self.hasCnameRecord = try values.decodeIfPresent(Bool.self, forKey: "has_cname_record")
            self.hasMxRecordsPresent = try values.decodeIfPresent(Bool.self, forKey: "has_mx_records_present")
            self.isValidDomain = try values.decodeIfPresent(Bool.self, forKey: "is_valid_domain")
            self.isApexDomain = try values.decodeIfPresent(Bool.self, forKey: "is_apex_domain")
            self.shouldBeARecord = try values.decodeIfPresent(Bool.self, forKey: "should_be_a_record")
            self.isCnameToGithubUserDomain = try values.decodeIfPresent(Bool.self, forKey: "is_cname_to_github_user_domain")
            self.isCnameToPagesDotGithubDotCom = try values.decodeIfPresent(Bool.self, forKey: "is_cname_to_pages_dot_github_dot_com")
            self.isCnameToFastly = try values.decodeIfPresent(Bool.self, forKey: "is_cname_to_fastly")
            self.isPointedToGithubPagesIp = try values.decodeIfPresent(Bool.self, forKey: "is_pointed_to_github_pages_ip")
            self.isNonGithubPagesIpPresent = try values.decodeIfPresent(Bool.self, forKey: "is_non_github_pages_ip_present")
            self.isPagesDomain = try values.decodeIfPresent(Bool.self, forKey: "is_pages_domain")
            self.isServedByPages = try values.decodeIfPresent(Bool.self, forKey: "is_served_by_pages")
            self.isValid = try values.decodeIfPresent(Bool.self, forKey: "is_valid")
            self.reason = try values.decodeIfPresent(String.self, forKey: "reason")
            self.respondsToHTTPS = try values.decodeIfPresent(Bool.self, forKey: "responds_to_https")
            self.enforcesHTTPS = try values.decodeIfPresent(Bool.self, forKey: "enforces_https")
            self.httpsError = try values.decodeIfPresent(String.self, forKey: "https_error")
            self.isHTTPSEligible = try values.decodeIfPresent(Bool.self, forKey: "is_https_eligible")
            self.caaError = try values.decodeIfPresent(String.self, forKey: "caa_error")
        }

        public func encode(to encoder: Encoder) throws {
            var values = encoder.container(keyedBy: StringCodingKey.self)
            try values.encodeIfPresent(host, forKey: "host")
            try values.encodeIfPresent(uri, forKey: "uri")
            try values.encodeIfPresent(nameservers, forKey: "nameservers")
            try values.encodeIfPresent(dnsResolves, forKey: "dns_resolves")
            try values.encodeIfPresent(isProxied, forKey: "is_proxied")
            try values.encodeIfPresent(isCloudflareIp, forKey: "is_cloudflare_ip")
            try values.encodeIfPresent(isFastlyIp, forKey: "is_fastly_ip")
            try values.encodeIfPresent(isOldIpAddress, forKey: "is_old_ip_address")
            try values.encodeIfPresent(isARecord, forKey: "is_a_record")
            try values.encodeIfPresent(hasCnameRecord, forKey: "has_cname_record")
            try values.encodeIfPresent(hasMxRecordsPresent, forKey: "has_mx_records_present")
            try values.encodeIfPresent(isValidDomain, forKey: "is_valid_domain")
            try values.encodeIfPresent(isApexDomain, forKey: "is_apex_domain")
            try values.encodeIfPresent(shouldBeARecord, forKey: "should_be_a_record")
            try values.encodeIfPresent(isCnameToGithubUserDomain, forKey: "is_cname_to_github_user_domain")
            try values.encodeIfPresent(isCnameToPagesDotGithubDotCom, forKey: "is_cname_to_pages_dot_github_dot_com")
            try values.encodeIfPresent(isCnameToFastly, forKey: "is_cname_to_fastly")
            try values.encodeIfPresent(isPointedToGithubPagesIp, forKey: "is_pointed_to_github_pages_ip")
            try values.encodeIfPresent(isNonGithubPagesIpPresent, forKey: "is_non_github_pages_ip_present")
            try values.encodeIfPresent(isPagesDomain, forKey: "is_pages_domain")
            try values.encodeIfPresent(isServedByPages, forKey: "is_served_by_pages")
            try values.encodeIfPresent(isValid, forKey: "is_valid")
            try values.encodeIfPresent(reason, forKey: "reason")
            try values.encodeIfPresent(respondsToHTTPS, forKey: "responds_to_https")
            try values.encodeIfPresent(enforcesHTTPS, forKey: "enforces_https")
            try values.encodeIfPresent(httpsError, forKey: "https_error")
            try values.encodeIfPresent(isHTTPSEligible, forKey: "is_https_eligible")
            try values.encodeIfPresent(caaError, forKey: "caa_error")
        }
    }

    public init(domain: Domain? = nil, altDomain: AltDomain? = nil) {
        self.domain = domain
        self.altDomain = altDomain
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.domain = try values.decodeIfPresent(Domain.self, forKey: "domain")
        self.altDomain = try values.decodeIfPresent(AltDomain.self, forKey: "alt_domain")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(domain, forKey: "domain")
        try values.encodeIfPresent(altDomain, forKey: "alt_domain")
    }
}
