// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

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

        public init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: StringCodingKey.self)
            self.email = try values.decodeIfPresent(String.self, forKey: "email")
            self.isVerified = try values.decodeIfPresent(Bool.self, forKey: "verified")
        }

        public func encode(to encoder: Encoder) throws {
            var values = encoder.container(keyedBy: StringCodingKey.self)
            try values.encodeIfPresent(email, forKey: "email")
            try values.encodeIfPresent(isVerified, forKey: "verified")
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

        public init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: StringCodingKey.self)
            self.id = try values.decodeIfPresent(Int.self, forKey: "id")
            self.primaryKeyID = try values.decodeIfPresent(Int.self, forKey: "primary_key_id")
            self.keyID = try values.decodeIfPresent(String.self, forKey: "key_id")
            self.publicKey = try values.decodeIfPresent(String.self, forKey: "public_key")
            self.emails = try values.decodeIfPresent([AnyJSON].self, forKey: "emails")
            self.subkeys = try values.decodeIfPresent([AnyJSON].self, forKey: "subkeys")
            self.canSign = try values.decodeIfPresent(Bool.self, forKey: "can_sign")
            self.canEncryptComms = try values.decodeIfPresent(Bool.self, forKey: "can_encrypt_comms")
            self.canEncryptStorage = try values.decodeIfPresent(Bool.self, forKey: "can_encrypt_storage")
            self.canCertify = try values.decodeIfPresent(Bool.self, forKey: "can_certify")
            self.createdAt = try values.decodeIfPresent(String.self, forKey: "created_at")
            self.expiresAt = try values.decodeIfPresent(String.self, forKey: "expires_at")
            self.rawKey = try values.decodeIfPresent(String.self, forKey: "raw_key")
        }

        public func encode(to encoder: Encoder) throws {
            var values = encoder.container(keyedBy: StringCodingKey.self)
            try values.encodeIfPresent(id, forKey: "id")
            try values.encodeIfPresent(primaryKeyID, forKey: "primary_key_id")
            try values.encodeIfPresent(keyID, forKey: "key_id")
            try values.encodeIfPresent(publicKey, forKey: "public_key")
            try values.encodeIfPresent(emails, forKey: "emails")
            try values.encodeIfPresent(subkeys, forKey: "subkeys")
            try values.encodeIfPresent(canSign, forKey: "can_sign")
            try values.encodeIfPresent(canEncryptComms, forKey: "can_encrypt_comms")
            try values.encodeIfPresent(canEncryptStorage, forKey: "can_encrypt_storage")
            try values.encodeIfPresent(canCertify, forKey: "can_certify")
            try values.encodeIfPresent(createdAt, forKey: "created_at")
            try values.encodeIfPresent(expiresAt, forKey: "expires_at")
            try values.encodeIfPresent(rawKey, forKey: "raw_key")
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

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.id = try values.decode(Int.self, forKey: "id")
        self.primaryKeyID = try values.decodeIfPresent(Int.self, forKey: "primary_key_id")
        self.keyID = try values.decode(String.self, forKey: "key_id")
        self.publicKey = try values.decode(String.self, forKey: "public_key")
        self.emails = try values.decode([Email].self, forKey: "emails")
        self.subkeys = try values.decode([Subkey].self, forKey: "subkeys")
        self.canSign = try values.decode(Bool.self, forKey: "can_sign")
        self.canEncryptComms = try values.decode(Bool.self, forKey: "can_encrypt_comms")
        self.canEncryptStorage = try values.decode(Bool.self, forKey: "can_encrypt_storage")
        self.canCertify = try values.decode(Bool.self, forKey: "can_certify")
        self.createdAt = try values.decode(Date.self, forKey: "created_at")
        self.expiresAt = try values.decodeIfPresent(Date.self, forKey: "expires_at")
        self.rawKey = try values.decodeIfPresent(String.self, forKey: "raw_key")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(id, forKey: "id")
        try values.encodeIfPresent(primaryKeyID, forKey: "primary_key_id")
        try values.encode(keyID, forKey: "key_id")
        try values.encode(publicKey, forKey: "public_key")
        try values.encode(emails, forKey: "emails")
        try values.encode(subkeys, forKey: "subkeys")
        try values.encode(canSign, forKey: "can_sign")
        try values.encode(canEncryptComms, forKey: "can_encrypt_comms")
        try values.encode(canEncryptStorage, forKey: "can_encrypt_storage")
        try values.encode(canCertify, forKey: "can_certify")
        try values.encode(createdAt, forKey: "created_at")
        try values.encodeIfPresent(expiresAt, forKey: "expires_at")
        try values.encodeIfPresent(rawKey, forKey: "raw_key")
    }
}
