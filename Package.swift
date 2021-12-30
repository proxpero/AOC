// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "AOC",
    platforms: [
        .macOS(.v12),
    ],
    products: [
        .library(
            name: "AdventOfCode",
            targets: ["AdventOfCode"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/pointfreeco/swift-parsing.git", from: "0.3.1"),
        .package(url: "https://github.com/apple/swift-algorithms", from: "1.0.0"),
        .package(url: "https://github.com/apple/swift-collections.git", .branch("main"))
    ],
    targets: [
        .target(
            name: "AdventOfCode",
            dependencies: []
        ),
    ]
)

let years = (2015 ... 2021)
package.targets.append(.executableTarget(
    name: "CLI",
    dependencies: years.map { .init(stringLiteral: "AOC\($0)") }
))
years.forEach { year in
    package.products.append(.library(
        name: "AOC\(year)",
        targets: ["AOC\(year)"]
    ))
    package.targets.append(.target(
        name: "AOC\(year)",
        dependencies: [
            "AdventOfCode",
            .product(name: "Parsing", package: "swift-parsing"),
            .product(name: "Algorithms", package: "swift-algorithms"),
            .product(name: "Collections", package: "swift-collections"),
        ],
        resources: [
            .process("Input"),
        ]
    ))
    package.targets.append(.testTarget(
        name: "AOC\(year)Tests",
        dependencies: [.init(stringLiteral: "AOC\(year)")]
    ))
}
