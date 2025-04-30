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
            url: "https://github.com/cloudx-xenoss/CloudXCoreiOS/releases/download/1.0.127/CloudXCore.xcframework.zip",
            checksum: "790c0ad9951815a41a8e243cce10df20b6dbb4829c410bb18f584c428f02fc79"
        )
    ]
)
