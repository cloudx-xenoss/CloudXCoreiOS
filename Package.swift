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
            url: "https://github.com/cloudx-xenoss/CloudXCoreiOS/releases/download/v1.1.1/CloudXCore.xcframework.zip",
            checksum: "b8e26e42a72e544bbd3554905e3aee80d42eb3db2d7fa68b0b204d97f3f9a448"
        )
    ]
)
