// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "MVP",
    products: [
    	.library(name: "MVP", targets: ["MVPTests"])
    ],
    dependencies: [
        .package(url: "https://github.com/Quick/Quick.git", from: "7.1.0"),
        .package(url: "https://github.com/Quick/Nimble.git", from: "12.1.0"),
        .package(url: "https://github.com/ashfurrow/Nimble-Snapshots", .upToNextMajor(from: "9.0.0"))
    ],
    targets: [
    	.testTarget(name: "MVPTests", dependencies: ["Quick", "Nimble", "Nimble-Snapshots"])
    ]
)
