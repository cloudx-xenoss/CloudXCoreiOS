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
            url: "https://github.com/cloudx-xenoss/CloudXCoreiOS/releases/download/v1.1.3/CloudXCore.xcframework.zip",
            checksum: "46fa91dff6cb6b4b9c93691092cd86c2e69e60c91aaf24c6bf1b42155248866b"
        )
    ]
)
