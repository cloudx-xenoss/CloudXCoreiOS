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
            url: "https://github.com/cloudx-xenoss/CloudXCoreiOS/releases/download/v1.1.39/CloudXCore.xcframework.zip",
            checksum: "9aa43bd78044f18ff54f08559ce21ae790cb5cbfe7e4d7509732400e85cfc8a0"
        )
    ]
)
