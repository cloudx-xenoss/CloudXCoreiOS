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
            url: "https://github.com/cloudx-xenoss/CloudXCoreiOS/releases/download/v1.1.15/CloudXCore.xcframework.zip",
            checksum: "12455f21182558e404bb6e54d24346dc99a077497105a37324c612a53ffdf9aa"
        )
    ]
)
