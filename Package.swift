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
            url: "https://github.com/cloudx-xenoss/CloudXCoreiOS/releases/download/v1.1.8/CloudXCore.xcframework.zip",
            checksum: "9c06325c4741ba3513f896808dbc3c2c83c6455862067487220668989cafa895"
        )
    ]
)
