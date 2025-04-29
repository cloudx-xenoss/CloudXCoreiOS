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
            url: "https://github.com/cloudx-xenoss/CloudXCoreiOS/releases/download/1.0.125/CloudXCore.xcframework.zip",
            checksum: "b41cb4b42e8cf56c2fc561db725c3031720fc7bb696e286f1fbfc4dfff95f54d"
        )
    ]
)
