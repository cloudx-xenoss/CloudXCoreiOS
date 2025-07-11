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
            url: "https://github.com/cloudx-xenoss/CloudXCoreiOS/releases/download/v1.1.28/CloudXCore.xcframework.zip",
            checksum: "6f29f5ede4a469405a6cc90455f82bac9dfe77e57a1a70271a53528b00ae56d0"
        )
    ]
)
