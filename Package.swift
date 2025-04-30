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
            url: "https://github.com/cloudx-xenoss/CloudXCoreiOS/releases/download/1.0.132/CloudXCore.xcframework.zip",
            checksum: "c6bd0ca85a9ebdf95ad1ba3d01e1489acc7a47386134d631d497c915eaacbedd"
        )
    ]
)
