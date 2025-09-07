// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TormyKit",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        // UIKit için kütüphane
        .library(
            name: "TormyUIKit",
            targets: ["TormyUIKit"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/SnapKit/SnapKit.git", from: "5.7.1")
    ],
    targets: [
        .target(
            name: "TormyUIKit",
            dependencies: ["SnapKit"],
            resources: [
                .process("Resources") // Resource klasörü burada işlenecek
            ]
        )
    ]
)
