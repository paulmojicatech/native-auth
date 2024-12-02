// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "PaulmojicatechNativeAuth",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "PaulmojicatechNativeAuth",
            targets: ["NativeAuthPlugin"])
    ],
    dependencies: [
        .package(url: "https://github.com/ionic-team/capacitor-swift-pm.git", branch: "main")
    ],
    targets: [
        .target(
            name: "NativeAuthPlugin",
            dependencies: [
                .product(name: "Capacitor", package: "capacitor-swift-pm"),
                .product(name: "Cordova", package: "capacitor-swift-pm")
            ],
            path: "ios/Sources/NativeAuthPlugin"),
        .testTarget(
            name: "NativeAuthPluginTests",
            dependencies: ["NativeAuthPlugin"],
            path: "ios/Tests/NativeAuthPluginTests")
    ]
)