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
            checksum: "26b755a591bd30bd7418e8245226e1b9ea94653bf94e824a47047e038896e547",
        ),
    ],
)
