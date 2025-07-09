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
            url: "https://github.com/cloudx-xenoss/CloudXCoreiOS/releases/download/v1.1.19/CloudXCore.xcframework.zip",
            checksum: "243bf7310c3ca224e1281bd22b6b8c2a6a53de3eeeadb79cf0487caba6639f1c"
        )
    ]
)
