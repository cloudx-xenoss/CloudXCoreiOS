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
            url: "https://github.com/cloudx-xenoss/CloudXCoreiOS/releases/download/v1.1.14/CloudXCore.xcframework.zip",
            checksum: "c381c8aedfffa89677707735a67ee80caad800b8d7b5fde8abd9aa03f1a760ca"
        )
    ]
)
