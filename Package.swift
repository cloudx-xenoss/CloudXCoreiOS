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
            url: "https://github.com/cloudx-xenoss/CloudXCoreiOS/releases/download/1.0.133/CloudXCore.xcframework.zip",
            checksum: "dbf792c3444bbb7e411b34158a1a5f3a79e2988f0c1667c62b6a6e00eecc85f1"
        )
    ]
)
