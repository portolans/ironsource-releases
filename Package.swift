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
            checksum: "dd3fd45ad0f4610a88b4fc46478749722a18f48b814da3781188b4a54a233a50",
        ),
    ],
)
