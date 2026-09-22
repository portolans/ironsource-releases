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
            url: "https://github.com/portolans/ironsource-releases/releases/download/8.13.1/IronSource.xcframework.zip",
            checksum: "4c03b90861c6900d25dbc9da4d0fcfd51a76d9b256fecab09e6562de26109243",
        ),
    ],
)
