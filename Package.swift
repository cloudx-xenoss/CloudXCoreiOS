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
            url: "https://github.com/cloudx-xenoss/CloudXCoreiOS/releases/download/1.0.129/CloudXCore.xcframework.zip",
            checksum: "3fa53f1a2f423c8ec2d3a468574a5110b6d5f10dae3de1cf648afe23adb8eb3b"
        )
    ]
)
