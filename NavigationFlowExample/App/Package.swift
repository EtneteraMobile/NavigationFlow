// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "App",
    platforms: [
        .iOS(.v16),
    ],
    products: [
        .library(
            name: "App",
            targets: ["App"]
        )
    ],
    dependencies: [
        .package(name: "Features", path: "../Features"),
        .package(name: "NavigationFlow", path: "../../")
    ],
    targets: [
        .target(
            name: "App",
            dependencies: [
                .product(name: "CatalogFeature", package: "Features"),
                .product(name: "ProductDetailFeature", package: "Features"),
                .product(name: "GalleryFeature", package: "Features"),
                .product(name: "FilterFeature", package: "Features"),
                .product(name: "NavigationFlow", package: "NavigationFlow")
            ],
            path: "App/Sources"
        )
    ]
)
