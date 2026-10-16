// swift-tools-version: 6.2

import PackageDescription

let package = Package(
    name: "CotabbyInference",
    platforms: [.macOS(.v14)],
    products: [
        .library(
            name: "CotabbyInference",
            targets: ["CotabbyInferenceEngine"]
        ),
    ],
    targets: [
        .binaryTarget(
            name: "llama-cpp",
            url: "https://github.com/PrismML-Eng/llama.cpp/releases/download/prism-b10777-e3de715/llama-prism-b10777-e3de715-xcframework.zip",
            checksum: "a44662fdc7e7b97838335e7df181ad62ce769f82167d249cacb4b24ef42a9653"
        ),
        .target(
            name: "CotabbyInferenceEngine",
            dependencies: ["llama-cpp"],
            path: "Sources/CotabbyInferenceEngine",
            publicHeadersPath: "include",
            cxxSettings: [
                .unsafeFlags(["-std=c++17"]),
            ]
        ),
        .testTarget(
            name: "CotabbyInferenceTests",
            dependencies: ["CotabbyInferenceEngine"],
            swiftSettings: [
                .interoperabilityMode(.Cxx),
            ]
        ),
    ]
)
