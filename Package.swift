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
            url: "https://github.com/cloudx-xenoss/CloudXCoreiOS/releases/download/v1.1.24/CloudXCore.xcframework.zip",
            checksum: "242ed03341c283a61b0d8652084f5cf90dde3160636b6f4beb0b5142bd8d63f0"
        )
    ]
)
