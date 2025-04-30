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
            url: "https://github.com/cloudx-xenoss/CloudXCoreiOS/releases/download/v1.0.136/CloudXCore.xcframework.zip",
            checksum: "4cee3157b5a35c3366cf02cfb374dafce8726d013c45ba62439058192f2c883f"
        )
    ]
)
