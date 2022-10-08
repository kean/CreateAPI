// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "petstore-entity-exclude",
    platforms: [.iOS(.v13), .macCatalyst(.v13), .macOS(.v10_15), .watchOS(.v6), .tvOS(.v13)],
    products: [
        .library(name: "petstore-entity-exclude", targets: ["petstore-entity-exclude"]),
    ],
    dependencies: [
        .package(url: "https://github.com/kean/Get", from: "2.1.0")
    ],
    targets: [
        .target(name: "petstore-entity-exclude", dependencies: [
            .product(name: "Get", package: "Get")
        ], path: "Sources")
    ]
)