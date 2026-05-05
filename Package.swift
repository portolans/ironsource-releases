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
            url: "https://github.com/portolans/ironsource-releases/releases/download/9.4.1/IronSource.xcframework.zip",
            checksum: "1e80309c0e1d89b20e131aee69000e68e2288c86b9dc8a3d702a46a4142a3a45",
        ),
    ],
)
