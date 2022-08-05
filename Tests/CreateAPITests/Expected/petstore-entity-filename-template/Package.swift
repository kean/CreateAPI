// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "petstore-entity-filename-template",
    platforms: [.iOS(.v13), .macCatalyst(.v13), .macOS(.v10_15), .watchOS(.v6), .tvOS(.v13)],
    products: [
        .library(name: "petstore-entity-filename-template", targets: ["petstore-entity-filename-template"]),
    ],
    dependencies: [
        .package(url: "https://github.com/kean/Get", from: "1.0.2")
    ],
    targets: [
        .target(name: "petstore-entity-filename-template", dependencies: [
            .product(name: "Get", package: "Get")
        ], path: "Sources")
    ]
)