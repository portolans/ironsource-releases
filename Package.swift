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
            checksum: "f16c8fe00f270381ca67f0151e1ea0f28532fc10c0a5fb4b5e2639e56a063133",
        ),
    ],
)
