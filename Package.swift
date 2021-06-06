// swift-tools-version:5.3

import PackageDescription


let package = Package(
    name: "ApodiniAsyncHTTPClient",
    platforms: [
        .macOS(.v10_15)
    ],
    products: [
        .library(name: "ApodiniAsyncHTTPClient", targets: ["ApodiniAsyncHTTPClient"])
    ],
    dependencies: [
        .package(url: "https://github.com/Apodini/Apodini.git", .branch("develop")),
        .package(url: "https://github.com/swift-server/async-http-client.git", from: "1.3.0")
    ],
    targets: [
        .target(
            name: "ApodiniAsyncHTTPClient",
            dependencies: [
                .product(name: "Apodini", package: "Apodini"),
                .product(name: "AsyncHTTPClient", package: "async-http-client")
            ]
        ),
        .testTarget(
            name: "ApodiniAsyncHTTPClientTests",
            dependencies: [
                .target(name: "ApodiniAsyncHTTPClient")
            ]
        )
    ]
)
