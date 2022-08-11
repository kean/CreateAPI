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
            .appending(GeneratorPackages.Get)
            .appending(if: isHTTPHeadersDependencyNeeded, GeneratorPackages.HTTPHeaders)
            .appending(if: isNaiveDateNeeded, GeneratorPackages.NaiveDate)
            .appending(if: isQueryEncoderNeeded, GeneratorPackages.URLQueryEncoder)
        
        let packagesDeclaration: String = allPackages
            .map(\.packageDeclaration)
            .joined(separator: ",\n")

        let dependenciesDeclaration: String = allPackages
            .map(\.productDeclaration)
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

private enum GeneratorPackages {
    
    static let Get = PackageDeclaration(url: URL(string: "https://github.com/kean/Get")!,
                                        module: "Get",
                                        rule: .from(version: "1.0.2"))
    
    static let HTTPHeaders = PackageDeclaration(url: URL(string: "https://github.com/CreateAPI/HTTPHeaders")!,
                                                module: "HTTPHeaders",
                                                rule: .from(version: "0.1.0"))
    
    static let NaiveDate = PackageDeclaration(url: URL(string: "https://github.com/CreateAPI/NaiveDate")!,
                                              module: "NaiveDate",
                                              rule: .from(version: "1.0.0"))
    
    static let URLQueryEncoder = PackageDeclaration(url: URL(string: "https://github.com/CreateAPI/URLQueryEncoder")!,
                                                    module: "URLQueryEncoder",
                                                    rule: .from(version: "0.2.0"))
}
