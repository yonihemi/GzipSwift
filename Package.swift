// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "Gzip",
    products: [
        .library(name: "Gzip", targets: ["Gzip"]),
    ],
    dependencies: [
        .package(name: "SwiftWasmZlib", url: "https://github.com/yonihemi/swiftwasm-zlib", from: "0.1.0"),
    ],
    targets: [
        .target(name: "Gzip", dependencies: [
            "system-zlib",
            .product(name: "SwiftWasmZlib", package: "SwiftWasmZlib", condition: .when(platforms: [.wasi])),
        ]),
        .target(name: "system-zlib"),
        .testTarget(name: "GzipTests", dependencies: ["Gzip"]),
    ],
    swiftLanguageVersions: [
        .v5,
    ]
)
