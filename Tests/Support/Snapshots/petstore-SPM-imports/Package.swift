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
        .package(url: "https://github.com/apple/swift-syntax.git", .upToNextMinor(from: "0.50600.1")),
        .package(url: "https://github.com/apple/swift-algorithms", "1.0.0"..<"2.1.0"),
        .package(url: "https://github.com/apple/swift-metrics.git", "2.0.0"..."3.1.0"),
        .package(url: "https://github.com/apple/swift-log", .branch("main")),
        .package(url: "https://github.com/apple/swift-numerics", .revision("7f2d022d3d9b55bf812814f5d01896cbfa0fd4da")),
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
            .product(name: "Metrics", package: "swift-metrics"),
            .product(name: "Logging", package: "swift-log"),
            .product(name: "Numerics", package: "swift-numerics"),
            .product(name: "Get", package: "Get"),
            .product(name: "HTTPHeaders", package: "HTTPHeaders"),
            .product(name: "URLQueryEncoder", package: "URLQueryEncoder")
        ], path: "Sources")
    ]
)