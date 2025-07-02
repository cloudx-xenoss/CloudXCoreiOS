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
            url: "https://github.com/cloudx-xenoss/CloudXCoreiOS/releases/download/v1.1.6/CloudXCore.xcframework.zip",
            checksum: "fd979531cfc25b1f487aa60bcca46ac5d321ea703e8e3f548c6377d6e63c4c42"
        )
    ]
)
