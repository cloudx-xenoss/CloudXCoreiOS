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
            url: "https://github.com/cloudx-xenoss/CloudXCoreiOS/releases/download/1.0.126/CloudXCore.xcframework.zip",
            checksum: "ab083c04d3d26c1ecac4a835a21620eac9511cf3029bfbff20b9e3c66d76ad22"
        )
    ]
)
