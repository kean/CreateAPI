import Foundation
import XCTest

final class PackageCompiler: NSObject {
    static let shared = PackageCompiler()

    private var dependencies: [PackageManifest.Dependency]
    private var shouldUpdateAllPackages: Bool

    override init() {
        self.dependencies = []
        self.shouldUpdateAllPackages = true
        super.init()

        // Observe the test run to know when all packages have been added
        #if os(macOS)
        XCTestObservationCenter.shared.addTestObserver(self)
        #endif
    }

    /// Tracks the package at the given location to be included in the AllPackages package after finishing the test run.
    /// This allows for the generated packages/snapshots to be compiled by CI.
    func addPackage(at packageURL: URL, name: String, supportsLinux: Bool) {
        dependencies.append(
            .init(packageURL: packageURL, name: name, supportsLinux: supportsLinux)
        )
    }

    /// Generates the Package.swift file and writes it to **Tests/Support/AllPackages/**
    private func writeManifestIfNeeded() {
        guard shouldUpdateAllPackages, !dependencies.isEmpty else { return }

        do {
            let manifest = PackageManifest(dependencies: dependencies)
            try manifest.write(to: manifestURL)
        } catch {
            fatalError("Failed to generate AllPackages manifest: \(error)")
        }
    }

    /// The location of the manifest url
    private var manifestURL: URL {
        URL(fileURLWithPath: #filePath)
            .appendingPathComponent("..")
            .appendingPathComponent("..")
            .appendingPathComponent("..")
            .appendingPathComponent("Support")
            .appendingPathComponent("AllPackages")
            .appendingPathComponent("Package.swift")
            .resolvingSymlinksInPath()
    }
}

// MARK: - XCTestObservation
#if os(macOS)
extension PackageCompiler: XCTestObservation {
    func testSuite(_ testSuite: XCTestSuite, didRecord issue: XCTIssue) {
        shouldUpdateAllPackages = false // don't update if a test failed
    }

    func testBundleDidFinish(_ testBundle: Bundle) {
        writeManifestIfNeeded()
    }
}
#endif

// MARK: - Generation
