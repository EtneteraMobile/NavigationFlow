// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Features",
    platforms: [
        .iOS(.v16),
    ],
    products: [
        .library(
            name: "CatalogFeature",
            targets: ["CatalogFeature"]
        ),
        .library(
            name: "ProductDetailFeature",
            targets: ["ProductDetailFeature"]
        ),
        .library(
            name: "GalleryFeature",
            targets: ["GalleryFeature"]
        ),
        .library(
            name: "FilterFeature",
            targets: ["FilterFeature"]
        )
    ],
    dependencies: [
        .package(name: "NavigationFlow", path: "../../")
    ],
    targets: [
        .target(
            name: "CatalogFeature",
            dependencies: [.product(name: "NavigationFlow", package: "NavigationFlow")],
            path: "Catalog/Sources"
        ),
        .target(
            name: "ProductDetailFeature",
            dependencies: [.product(name: "NavigationFlow", package: "NavigationFlow")],
            path: "ProductDetail/Sources"
        ),
        .target(
            name: "GalleryFeature",
            dependencies: [.product(name: "NavigationFlow", package: "NavigationFlow")],
            path: "Gallery/Sources"
        ),
        .target(
            name: "FilterFeature",
            dependencies: [.product(name: "NavigationFlow", package: "NavigationFlow")],
            path: "Filter/Sources"
        ),
    ]
)
