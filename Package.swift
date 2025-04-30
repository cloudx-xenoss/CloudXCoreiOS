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
            url: "https://github.com/cloudx-xenoss/CloudXCoreiOS/releases/download/1.0.130/CloudXCore.xcframework.zip",
            checksum: "efa0ef53e2e0ce298e2d7426f0520df0338e41767509cedf0d0bf98755cbe77a"
        )
    ]
)
