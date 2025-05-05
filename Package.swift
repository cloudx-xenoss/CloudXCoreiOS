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
            url: "https://github.com/cloudx-xenoss/CloudXCoreiOS/releases/download/v1.1.2/CloudXCore.xcframework.zip",
            checksum: "cc90c10447e98c2854db04ef90ead8cc154e8df4c869062581caf897edc4aec3"
        )
    ]
)
