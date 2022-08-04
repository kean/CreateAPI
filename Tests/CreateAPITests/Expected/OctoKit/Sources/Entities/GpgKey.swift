// Generated by Create API
// https://github.com/CreateAPI/CreateAPI
//
// swiftlint:disable all

import Foundation
import NaiveDate

/// A unique encryption key
public struct GpgKey: Codable {
    public var id: Int
    public var primaryKeyID: Int?
    /// Example: "3262EFF25BA0D270"
    public var keyID: String
    /// Example: "xsBNBFayYZ..."
    public var publicKey: String
    /// Example:
    ///
    /// [
    ///   {
    ///     "email" : "mastahyeti@users.noreply.github.com",
    ///     "verified" : true
    ///   }
    /// ]
    public var emails: [Email]
    /// Example:
    ///
    /// [
    ///   {
    ///     "can_certify" : false,
    ///     "can_encrypt_comms" : true,
    ///     "can_encrypt_storage" : true,
    ///     "can_sign" : false,
    ///     "created_at" : "2016-03-24T11:31:04-06:00",
    ///     "emails" : [
    /// 
    ///     ],
    ///     "expires_at" : null,
    ///     "id" : 4,
    ///     "key_id" : "4A595D4C72EE49C7",
    ///     "primary_key_id" : 3,
    ///     "public_key" : "zsBNBFayYZ...",
    ///     "subkeys" : [
    /// 
    ///     ]
    ///   }
    /// ]
    public var subkeys: [Subkey]
    /// Example: true
    public var canSign: Bool
    public var canEncryptComms: Bool
    public var canEncryptStorage: Bool
    /// Example: true
    public var canCertify: Bool
    /// Example: "2016-03-24T11:31:04-06:00"
    public var createdAt: Date
    public var expiresAt: Date?
    public var rawKey: String?

    public struct Email: Codable {
        public var email: String?
        public var isVerified: Bool?

        public init(email: String? = nil, isVerified: Bool? = nil) {
            self.email = email
            self.isVerified = isVerified
        }

        private enum CodingKeys: String, CodingKey {
            case email
            case isVerified = "verified"
        }
    }

    public struct Subkey: Codable {
        public var id: Int?
        public var primaryKeyID: Int?
        public var keyID: String?
        public var publicKey: String?
        public var emails: [AnyJSON]?
        public var subkeys: [AnyJSON]?
        public var canSign: Bool?
        public var canEncryptComms: Bool?
        public var canEncryptStorage: Bool?
        public var canCertify: Bool?
        public var createdAt: String?
        public var expiresAt: String?
        public var rawKey: String?

        public init(id: Int? = nil, primaryKeyID: Int? = nil, keyID: String? = nil, publicKey: String? = nil, emails: [AnyJSON]? = nil, subkeys: [AnyJSON]? = nil, canSign: Bool? = nil, canEncryptComms: Bool? = nil, canEncryptStorage: Bool? = nil, canCertify: Bool? = nil, createdAt: String? = nil, expiresAt: String? = nil, rawKey: String? = nil) {
            self.id = id
            self.primaryKeyID = primaryKeyID
            self.keyID = keyID
            self.publicKey = publicKey
            self.emails = emails
            self.subkeys = subkeys
            self.canSign = canSign
            self.canEncryptComms = canEncryptComms
            self.canEncryptStorage = canEncryptStorage
            self.canCertify = canCertify
            self.createdAt = createdAt
            self.expiresAt = expiresAt
            self.rawKey = rawKey
        }

        private enum CodingKeys: String, CodingKey {
            case id
            case primaryKeyID = "primary_key_id"
            case keyID = "key_id"
            case publicKey = "public_key"
            case emails
            case subkeys
            case canSign = "can_sign"
            case canEncryptComms = "can_encrypt_comms"
            case canEncryptStorage = "can_encrypt_storage"
            case canCertify = "can_certify"
            case createdAt = "created_at"
            case expiresAt = "expires_at"
            case rawKey = "raw_key"
        }
    }

    public init(id: Int, primaryKeyID: Int? = nil, keyID: String, publicKey: String, emails: [Email], subkeys: [Subkey], canSign: Bool, canEncryptComms: Bool, canEncryptStorage: Bool, canCertify: Bool, createdAt: Date, expiresAt: Date? = nil, rawKey: String? = nil) {
        self.id = id
        self.primaryKeyID = primaryKeyID
        self.keyID = keyID
        self.publicKey = publicKey
        self.emails = emails
        self.subkeys = subkeys
        self.canSign = canSign
        self.canEncryptComms = canEncryptComms
        self.canEncryptStorage = canEncryptStorage
        self.canCertify = canCertify
        self.createdAt = createdAt
        self.expiresAt = expiresAt
        self.rawKey = rawKey
    }

    private enum CodingKeys: String, CodingKey {
        case id
        case primaryKeyID = "primary_key_id"
        case keyID = "key_id"
        case publicKey = "public_key"
        case emails
        case subkeys
        case canSign = "can_sign"
        case canEncryptComms = "can_encrypt_comms"
        case canEncryptStorage = "can_encrypt_storage"
        case canCertify = "can_certify"
        case createdAt = "created_at"
        case expiresAt = "expires_at"
        case rawKey = "raw_key"
    }
}