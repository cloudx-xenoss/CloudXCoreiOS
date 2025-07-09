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
            url: "https://github.com/cloudx-xenoss/CloudXCoreiOS/releases/download/v1.1.16/CloudXCore.xcframework.zip",
            checksum: "a2e751ea8dfb565922713947afd5f10b4059e9de51c6bca3138bf12576c5ae9f"
        )
    ]
)
