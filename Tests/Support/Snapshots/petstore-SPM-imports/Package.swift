// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "petstore-SPM-imports",
    platforms: [.iOS(.v13), .macCatalyst(.v13), .macOS(.v10_15), .watchOS(.v6), .tvOS(.v13)],
    products: [
        .library(name: "petstore-SPM-imports", targets: ["petstore-SPM-imports"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser", .exact("1.1.1")),
        .package(url: "https://github.com/apple/swift-atomics", .upToNextMajor(from: "1.0.0")),
        .package(url: "https://github.com/apple/swift-syntax", .upToNextMinor(from: "0.50600.1")),
        .package(url: "https://github.com/apple/swift-algorithms", "1.0.0"..<"2.1.0"),
        .package(url: "https://github.com/apple/swift-nio", "2.41.1"..."3.1.0"),
        .package(url: "https://github.com/apple/swift-experimental-string-processing", .branch("main")),
        .package(url: "https://github.com/apple/swift-distributed-actors", .revision("9da657e933f7c302277eef373c4a0d74e90f2bfa")),
        .package(url: "https://github.com/kean/Get", from: "1.0.2"),
        .package(url: "https://github.com/CreateAPI/HTTPHeaders", from: "0.1.0"),
        .package(url: "https://github.com/CreateAPI/URLQueryEncoder", from: "0.2.0")
    ],
    targets: [
        .target(name: "petstore-SPM-imports", dependencies: [
            .product(name: "ArgumentParser", package: "swift-argument-parser"),
            .product(name: "Atomics", package: "swift-atomics"),
            .product(name: "SwiftSyntax", package: "swift-syntax"),
            .product(name: "Algorithms", package: "swift-algorithms"),
            .product(name: "NIOCore", package: "swift-nio"),
            .product(name: "_StringProcessing", package: "swift-experimental-string-processing"),
            .product(name: "DistributedActors", package: "swift-distributed-actors"),
            .product(name: "Get", package: "Get"),
            .product(name: "HTTPHeaders", package: "HTTPHeaders"),
            .product(name: "URLQueryEncoder", package: "URLQueryEncoder")
        ], path: "Sources")
    ]
)