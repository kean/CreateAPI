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
    public enum PrebuildAvailability: String, Codable, CaseIterable {
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

    private enum CodingKeys: String, CodingKey {
        case name
        case displayName = "display_name"
        case operatingSystem = "operating_system"
        case storageInBytes = "storage_in_bytes"
        case memoryInBytes = "memory_in_bytes"
        case cpus
        case prebuildAvailability = "prebuild_availability"
    }
}
