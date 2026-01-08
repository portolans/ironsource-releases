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
            url: "https://github.com/portolans/ironsource-releases/releases/download/IronSource_9.2.0/IronSource.xcframework.zip",
            checksum: "0eb9d66657a42a3c79c7d780673057e923f1d5c794968b5080124d13775d897d",
        ),
    ],
)
