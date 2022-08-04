// Generated by Create API
// https://github.com/CreateAPI/CreateAPI
//
// swiftlint:disable all

import Foundation
import NaiveDate

public struct ScimUserListEnterprise: Codable {
    public var schemas: [String]
    public var totalResults: Double
    public var itemsPerPage: Double
    public var startIndex: Double
    public var resources: [Resource]

    public struct Resource: Codable {
        public var schemas: [String]
        public var id: String
        public var externalID: String?
        public var userName: String?
        public var name: Name?
        public var emails: [Email]?
        public var groups: [Group]?
        public var isActive: Bool?
        public var meta: Meta?

        public struct Name: Codable {
            public var givenName: String?
            public var familyName: String?

            public init(givenName: String? = nil, familyName: String? = nil) {
                self.givenName = givenName
                self.familyName = familyName
            }
        }

        public struct Email: Codable {
            public var value: String?
            public var isPrimary: Bool?
            public var type: String?

            public init(value: String? = nil, isPrimary: Bool? = nil, type: String? = nil) {
                self.value = value
                self.isPrimary = isPrimary
                self.type = type
            }

            private enum CodingKeys: String, CodingKey {
                case value
                case isPrimary = "primary"
                case type
            }
        }

        public struct Group: Codable {
            public var value: String?

            public init(value: String? = nil) {
                self.value = value
            }
        }

        public struct Meta: Codable {
            public var resourceType: String?
            public var created: String?
            public var lastModified: String?
            public var location: String?

            public init(resourceType: String? = nil, created: String? = nil, lastModified: String? = nil, location: String? = nil) {
                self.resourceType = resourceType
                self.created = created
                self.lastModified = lastModified
                self.location = location
            }
        }

        public init(schemas: [String], id: String, externalID: String? = nil, userName: String? = nil, name: Name? = nil, emails: [Email]? = nil, groups: [Group]? = nil, isActive: Bool? = nil, meta: Meta? = nil) {
            self.schemas = schemas
            self.id = id
            self.externalID = externalID
            self.userName = userName
            self.name = name
            self.emails = emails
            self.groups = groups
            self.isActive = isActive
            self.meta = meta
        }

        private enum CodingKeys: String, CodingKey {
            case schemas
            case id
            case externalID = "externalId"
            case userName
            case name
            case emails
            case groups
            case isActive = "active"
            case meta
        }
    }

    public init(schemas: [String], totalResults: Double, itemsPerPage: Double, startIndex: Double, resources: [Resource]) {
        self.schemas = schemas
        self.totalResults = totalResults
        self.itemsPerPage = itemsPerPage
        self.startIndex = startIndex
        self.resources = resources
    }

    private enum CodingKeys: String, CodingKey {
        case schemas
        case totalResults
        case itemsPerPage
        case startIndex
        case resources = "Resources"
    }
}