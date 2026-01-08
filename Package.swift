// swift-tools-version:6.2
import PackageDescription

let package = Package(
    name: "IronSource",
    platforms: [
        .iOS(.v12),
    ],
    products: [
        .library(
            name: "IronSource",
            targets: ["IronSource"],
        ),
    ],
    targets: [
        .binaryTarget(
            name: "IronSource",
            url: "https://github.com/portolans/ironsource-releases/releases/download/9.2.0/IronSource.xcframework.zip",
            checksum: "7a22109f1e7d34007a4ef8ebad4eb34d00fdd5e8dab93174b028645b5c53b17b",
        ),
    ],
)
