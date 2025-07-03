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
            url: "https://github.com/cloudx-xenoss/CloudXCoreiOS/releases/download/v1.1.9/CloudXCore.xcframework.zip",
            checksum: "ed935adcf6ab96aabedf607bc2fcd1056f8863d0a412060c0094b3494966f14a"
        )
    ]
)
