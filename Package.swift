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
            url: "https://github.com/cloudx-xenoss/CloudXCoreiOS/releases/download/1.0.123/CloudXCore.xcframework.zip",
            checksum: "90fae3c10ce318d75e8c584ff96c4e09c1a6c47220bf4b2699894ef0742cb9d5"
        )
    ]
)
