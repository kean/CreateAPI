import Foundation
import CreateOptions

extension Generator {
    func package(named name: String?) -> (name: String, manifest: GeneratedFile)? {
        guard let name = name else { return nil }
        let manifest = GeneratedFile(name: "Package", contents: makePackageFile(name: name))
        return (name, manifest)
    }

    func makePackageFile(name: String) -> String {
        let allPackages = options.package.dependencies
            .appending(.get)
            .appending(.httpHeaders, if: isHTTPHeadersDependencyNeeded)
            .appending(.naiveDate, if: isNaiveDateNeeded)
            .appending(.urlQueryEncoder, if: isQueryEncoderNeeded)
        
        let urlPackagesDeclaration = allPackages.map(\.packageDeclaration)
        let pathPackageDeclaration = options.package.pathDependencies.map(\.packageDeclaration)
        let packagesDeclaration = (urlPackagesDeclaration + pathPackageDeclaration)
            .joined(separator: ",\n")

        let urlDependenciesDeclaration = allPackages.map(\.productDeclarations)
        let pathDependenciesDeclaration = options.package.pathDependencies.map(\.productDeclarations)

        let dependenciesDeclaration = (urlDependenciesDeclaration + pathDependenciesDeclaration)
            .reduce(Array<String>()) { partialResult, currentImports in
                return partialResult.appending(contentsOf: currentImports)
            }
            .joined(separator: ",\n")

        return """
        // swift-tools-version:5.5
        // The swift-tools-version declares the minimum version of Swift required to build this package.

        import PackageDescription

        let package = Package(
            name: "\(name)",
            platforms: [.iOS(.v13), .macCatalyst(.v13), .macOS(.v10_15), .watchOS(.v6), .tvOS(.v13)],
            products: [
                .library(name: "\(name)", targets: ["\(name)"]),
            ],
            dependencies: [
        \(packagesDeclaration.indented(count: 2))
            ],
            targets: [
                .target(name: "\(name)", dependencies: [
        \(dependenciesDeclaration.indented(count: 3))
                ], path: "Sources")
            ]
        )
        """
    }
}
