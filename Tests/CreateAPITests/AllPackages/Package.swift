// swift-tools-version: 5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

// A test helper that allows us to compile all generated packages quickly and easily
// TODO: We should probably generate this file on-demand for the tests rather than having to edit it each time.

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
        .package(path: "../Expected/cookpad"),
        .package(path: "../Expected/discriminator"),
        .package(path: "../Expected/edgecases-change-access-control"),
        .package(path: "../Expected/edgecases-coding-keys"),
        .package(path: "../Expected/edgecases-default"),
        .package(path: "../Expected/edgecases-disable-acronyms"),
        .package(path: "../Expected/edgecases-disable-enums"),
        .package(path: "../Expected/edgecases-indent-with-two-width-spaces"),
        .package(path: "../Expected/edgecases-int32-int64"),
        .package(path: "../Expected/edgecases-rename"),
        .package(path: "../Expected/edgecases-rename-properties"),
        .package(path: "../Expected/edgecases-tabs"),
        .package(path: "../Expected/edgecases-yaml-config"),
        .package(path: "../Expected/inlining-default"),
        .package(path: "../Expected/OctoKit"),
        .package(path: "../Expected/petstore-base-class"),
        .package(path: "../Expected/petstore-change-entityname"),
        .package(path: "../Expected/petstore-change-filename"),
        .package(path: "../Expected/petstore-change-namespace-when-operations-style"),
        .package(path: "../Expected/petstore-change-namespace-when-rest-style"),
        .package(path: "../Expected/petstore-custom-imports"),
        .package(path: "../Expected/petstore-default"),
        .package(path: "../Expected/petstore-disable-comments"),
        .package(path: "../Expected/petstore-disable-init-with-coder"),
        .package(path: "../Expected/petstore-disable-inlining"),
        .package(path: "../Expected/petstore-disable-mutable-properties"),
        .package(path: "../Expected/petstore-enable-mutable-properties"),
        .package(path: "../Expected/petstore-filename-template"),
        .package(path: "../Expected/petstore-generate-classes"),
        .package(path: "../Expected/petstore-identifiable"),
        .package(path: "../Expected/petstore-only-schemas"),
        .package(path: "../Expected/petstore-single-threaded"),
        .package(path: "../Expected/petstore-some-entities-as-classes"),
        .package(path: "../Expected/petstore-some-entities-as-structs"),
        .package(path: "../Expected/petstore-merge-sources"),
        .package(path: "../Expected/strip-parent-name-nested-objects-default"),
        .package(path: "../Expected/strip-parent-name-nested-objects-enabled"),
        .package(path: "../Expected/test-query-parameters")
    ],
    targets: [
        .target(
            name: "AllPackages",
            dependencies: [
                "cookpad",
                "discriminator",
                "edgecases-change-access-control",
                "edgecases-coding-keys",
                "edgecases-default",
                "edgecases-disable-acronyms",
                "edgecases-disable-enums",
                "edgecases-indent-with-two-width-spaces",
                "edgecases-int32-int64",
                "edgecases-rename",
                "edgecases-rename-properties",
                "edgecases-tabs",
                "edgecases-yaml-config",
                "inlining-default",
                "OctoKit",
                "petstore-base-class",
                "petstore-change-entityname",
                "petstore-change-filename",
                "petstore-change-namespace-when-operations-style",
                "petstore-change-namespace-when-rest-style",
                .byName(name: "petstore-custom-imports", condition: .when(platforms: [.iOS, .macOS])),
                "petstore-default",
                "petstore-disable-comments",
                "petstore-disable-init-with-coder",
                "petstore-disable-inlining",
                "petstore-disable-mutable-properties",
                "petstore-enable-mutable-properties",
                "petstore-filename-template",
                "petstore-generate-classes",
                "petstore-identifiable",
                "petstore-only-schemas",
                "petstore-single-threaded",
                "petstore-some-entities-as-classes",
                "petstore-some-entities-as-structs",
                "petstore-merge-sources",
                "strip-parent-name-nested-objects-default",
                "strip-parent-name-nested-objects-enabled",
                "test-query-parameters"
            ],
            path: "Sources"
        )
    ]
)
