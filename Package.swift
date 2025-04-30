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
            url: "https://github.com/cloudx-xenoss/CloudXCoreiOS/releases/download/v1.0.135/CloudXCore.xcframework.zip",
            checksum: "0685649fc0a730574ab2672faaf0c4bd00e096d5fe19a9d544bf7a84fe958258"
        )
    ]
)
