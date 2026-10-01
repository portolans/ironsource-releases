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
                .unsafeFlags(["-Xlinker", "-ObjC"]), // Required to support IronSource's use of Objective-C extensions on common types.
            ],
        ),
        .binaryTarget(
            name: "IronSourceBinary",
            url: "https://github.com/portolans/ironsource-releases/releases/download/9.6.1/IronSource.xcframework.zip",
            checksum: "13a364fe74fc2f658e1e08ff5b75b0e58978b0c2ab5a5ede6d90a0f40cc9daad",
        ),
    ],
)
