// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "CloudXCore", 
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "CloudXCore",
            targets: ["CloudXCore"]
        ),
    ],
    targets: [
        .binaryTarget(
            name: "CloudXCore",
            url: "https://github.com/cloudx-xenoss/CloudXCoreiOS/releases/download/1.0.128/CloudXCore.xcframework.zip",
            checksum: "0d4774e8af1dd949f73ed86f72a6310b2b4a2fcd36f8d486ff57bc747cd3dbb0"
        )
    ]
)
