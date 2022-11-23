// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DataDrivenUI",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v13),
        .watchOS(.v6),
        .tvOS(.v13)
    ],
    products: [
        .library(
            name: "DataDrivenUI",
            targets: ["DataDrivenUI"]
        )
    ],
    targets: [
        .target(
            name: "DataDrivenUI",
            dependencies: []
        ),
        .testTarget(
            name: "DataDrivenUITests",
            dependencies: ["DataDrivenUI"]
        )
    ]
)
