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
            url: "https://github.com/cloudx-xenoss/CloudXCoreiOS/releases/download/v1.1.4/CloudXCore.xcframework.zip",
            checksum: "2f0dcac3529b1450e406d92904d9008fbdb35bb02ca766c9777dcc428cd2b006"
        )
    ]
)
