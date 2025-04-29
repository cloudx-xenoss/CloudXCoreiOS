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
            url: "https://github.com/cloudx-xenoss/CloudXCoreiOS/releases/download/1.0.124/CloudXCore.xcframework.zip",
            checksum: "bbd6ad47ecdf10a9a19089b4e362804745f70346446a935cc659a54004b11f88"
        )
    ]
)
