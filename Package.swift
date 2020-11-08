// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AOC",
    products: [
        .library(
            name: "AOC",
            targets: ["AOC"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-algorithms", from: "0.0.1"),
        .package(url: "https://github.com/proxpero/Parser.git", .branch("main"))

    ],
    targets: [
        .target(
            name: "CLI",
            dependencies: [
                "AOC"
            ]
        ),
        .target(
            name: "AOC",
            dependencies: [
                .product(name: "Algorithms", package: "swift-algorithms"),
                .product(name: "Parser", package: "Parser")
            ]
        ),
        .testTarget(
            name: "AOCTests",
            dependencies: ["AOC"]
        )
    ]
)
