// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ENotification",
    defaultLocalization: "en",
    platforms: [.iOS(.v14)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "ENotification",
            targets: ["ENotification"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(name: "Routing", url: "https://github.com/denizkashin/the-emotion-routing.git", .branch("develop")),
        .package(name: "DesignSystem", url: "https://github.com/amattit/DesignSystem.git", .branch("main")),
        .package(name: "Services",
                 url: "https://github.com/denizkashin/the-emotion-services.git",
                 .branch("develop")),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "ENotification",
            dependencies: ["Routing", "DesignSystem", "Services"],
            resources: [.process("Resources")]
        ),
        .testTarget(
            name: "ENotificationTests",
            dependencies: ["ENotification"]
        ),
    ]
)
