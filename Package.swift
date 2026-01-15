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
        .target(
            name: "IronSource",
            dependencies: ["IronSourceBinary"],
            resources: [.copy("Resources/PrivacyInfo.xcprivacy")],
            linkerSettings: [
                .unsafeFlags(["-ObjC"]), // Required to support IronSource's use of Objective-C extensions on common types.
            ],
        ),
        .binaryTarget(
            name: "IronSourceBinary",
            url: "https://github.com/portolans/ironsource-releases/releases/download/9.2.0/IronSource.xcframework.zip",
            checksum: "4ecde8ef03d7274589fdc2681a22bb80159a5e5d3cb9c47d778039e8bb0e58cb",
        ),
    ],
)
