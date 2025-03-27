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
            url: "https://github.com/cloudx-xenoss/CloudXCoreiOS/releases/latest/download/CloudXCore.xcframework.zip",
            checksum: "065564397d5191c99fd424abab9df5ec068406b8bafcbe122c646466cbe88a2f"
        )
    ]
)
