import Foundation

struct PackageManifest {
    struct Dependency: Equatable {
        let packageURL: URL
        let name: String
        let supportsLinux: Bool
    }

    let dependencies: [Dependency]

    func write(to fileURL: URL) throws {
        let dependencies = dependencies.sorted()
        let packageURL = fileURL.deletingLastPathComponent()

        let packageDependencies = dependencies
            .map { dependencyItem(for: $0, relativeTo: packageURL).asArrayItem(indentation: 8) }
            .joined(separator: "\n")
            .removingLast() // remove the trailing comma

        let targetDependencies = dependencies
            .map { targetDependencyItem(for: $0).asArrayItem(indentation: 16) }
            .joined(separator: "\n")
            .removingLast() // remove the trailing comma

        let contents = packageManifestTemplate
            .replacingOccurrences(of: "{{PACKAGE_DEPENDENCIES}}", with: packageDependencies)
            .replacingOccurrences(of: "{{TARGET_DEPENDENCIES}}", with: targetDependencies)

        try contents.write(to: fileURL, atomically: false, encoding: .utf8)
    }

    private func dependencyItem(for dependency: Dependency, relativeTo packageURL: URL) -> String {
        // .package(path: "../Snapshots/petstore-disable-init-with-coder")
        let path = dependency.packageURL.relativePath(to: packageURL)
        return ".package(path: \(path.inDoubleQuotes))"
    }

    private func targetDependencyItem(for dependency: Dependency) -> String {
        if dependency.supportsLinux {
            // "petstore-custom-imports"
            return dependency.name.inDoubleQuotes
        } else {
            // .byName(name: "petstore-custom-imports", condition: .when(platforms: [.macOS]))
            return ".byName(name: \(dependency.name.inDoubleQuotes), condition: .when(platforms: [.macOS]))"
        }
    }

    static func productName(in packageURL: URL) throws -> String? {
        let manifestURL = packageURL.appendingPathComponent("Package.swift")
        guard FileManager.default.fileExists(atPath: manifestURL.path) else { return nil }

        let contents = try String(contentsOf: manifestURL)
        let range = NSRange(contents.startIndex ..< contents.endIndex, in: contents)
        let regex = try NSRegularExpression(pattern: #"library\(name: "(.*)", targets"#)

        guard let match = regex.firstMatch(in: contents, range: range) else {
            return nil
        }

        let groupRange = match.range(at: 1)
        guard let range = Range(groupRange, in: contents) else {
            return nil
        }

        return String(contents[range])
    }
}

extension PackageManifest.Dependency: Comparable {
    static func < (lhs: PackageManifest.Dependency, rhs: PackageManifest.Dependency) -> Bool {
        lhs.packageURL.absoluteString.caseInsensitiveCompare(rhs.packageURL.absoluteString) == .orderedAscending
    }
}

private extension String {
    var inDoubleQuotes: String {
        "\"\(self)\""
    }

    func asArrayItem(indentation: Int) -> String {
        String(repeating: " ", count: indentation) + self + ","
    }

    func removingLast() -> String {
        var string = self
        string.removeLast()
        return string
    }
}

private extension URL {
    /// Returns the relative path between the receiver and a given url
    ///
    /// ```swift
    /// let base = URL(fileURLWithPath: "/a/b/c/d")
    /// let other = URL(fileURLWithPath: "/a/b/c/z/y/x/w")
    /// other.relativePath(to: base) // "../z/y/x/w"
    /// ```
    func relativePath(to start: URL) -> String {
        var startComponents = start.pathComponents
        var destComponents = self.pathComponents

        while let s = startComponents.first, let d = destComponents.first, s == d {
            startComponents.removeFirst()
            destComponents.removeFirst()
        }

        let ups = Array(repeating: "..", count: startComponents.count)
        var final = ups + destComponents

        if final.isEmpty { final = ["."] }

        return final.joined(separator: "/")
    }
}

private let packageManifestTemplate = """
 // swift-tools-version: 5.5
 // The swift-tools-version declares the minimum version of Swift required to build this package.

 // A test helper that allows us to compile all generated packages quickly and easily

 import PackageDescription

 let package = Package(
     name: "AllPackages",
     platforms: [
         .macOS(.v10_15)
     ],
     products: [
         .library(name: "AllPackages", targets: ["AllPackages"])
     ],
     dependencies: [
 {{PACKAGE_DEPENDENCIES}}
     ],
     targets: [
         .target(
             name: "AllPackages",
             dependencies: [
 {{TARGET_DEPENDENCIES}}
             ],
             path: "Sources"
         )
     ]
 )

 """
