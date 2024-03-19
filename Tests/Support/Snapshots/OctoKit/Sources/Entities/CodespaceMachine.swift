// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import NaiveDate

/// A description of the machine powering a codespace.
public struct CodespaceMachine: Codable {
    /// The name of the machine.
    ///
    /// Example: "standardLinux"
    public var name: String
    /// The display name of the machine includes cores, memory, and storage.
    ///
    /// Example: "4 cores, 8 GB RAM, 64 GB storage"
    public var displayName: String
    /// The operating system of the machine.
    ///
    /// Example: "linux"
    public var operatingSystem: String
    /// How much storage is available to the codespace.
    ///
    /// Example: 68719476736
    public var storageInBytes: Int
    /// How much memory is available to the codespace.
    ///
    /// Example: 8589934592
    public var memoryInBytes: Int
    /// How many cores are available to the codespace.
    public var cpus: Int
    /// Whether a prebuild is currently available when creating a codespace for this machine and repository. If a branch was not specified as a ref, the default branch will be assumed. Value will be "null" if prebuilds are not supported or prebuild availability could not be determined. Value is the type of prebuild available, or "none" if none are available.
    ///
    /// Example: "blob"
    public var prebuildAvailability: PrebuildAvailability?

    /// Whether a prebuild is currently available when creating a codespace for this machine and repository. If a branch was not specified as a ref, the default branch will be assumed. Value will be "null" if prebuilds are not supported or prebuild availability could not be determined. Value is the type of prebuild available, or "none" if none are available.
    ///
    /// Example: "blob"
    public enum PrebuildAvailability: String, CaseIterable, Codable {
        case `none`
        case blob
        case pool
    }

    public init(name: String, displayName: String, operatingSystem: String, storageInBytes: Int, memoryInBytes: Int, cpus: Int, prebuildAvailability: PrebuildAvailability? = nil) {
        self.name = name
        self.displayName = displayName
        self.operatingSystem = operatingSystem
        self.storageInBytes = storageInBytes
        self.memoryInBytes = memoryInBytes
        self.cpus = cpus
        self.prebuildAvailability = prebuildAvailability
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.name = try values.decode(String.self, forKey: "name")
        self.displayName = try values.decode(String.self, forKey: "display_name")
        self.operatingSystem = try values.decode(String.self, forKey: "operating_system")
        self.storageInBytes = try values.decode(Int.self, forKey: "storage_in_bytes")
        self.memoryInBytes = try values.decode(Int.self, forKey: "memory_in_bytes")
        self.cpus = try values.decode(Int.self, forKey: "cpus")
        self.prebuildAvailability = try values.decodeIfPresent(PrebuildAvailability.self, forKey: "prebuild_availability")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(name, forKey: "name")
        try values.encode(displayName, forKey: "display_name")
        try values.encode(operatingSystem, forKey: "operating_system")
        try values.encode(storageInBytes, forKey: "storage_in_bytes")
        try values.encode(memoryInBytes, forKey: "memory_in_bytes")
        try values.encode(cpus, forKey: "cpus")
        try values.encodeIfPresent(prebuildAvailability, forKey: "prebuild_availability")
    }
}
