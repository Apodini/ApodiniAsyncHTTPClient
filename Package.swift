// swift-tools-version:5.5

//
// This source file is part of the Apodini AsyncHTTPClient open source project
//
// SPDX-FileCopyrightText: 2021 Paul Schmiedmayer and the project authors (see CONTRIBUTORS.md) <paul.schmiedmayer@tum.de>
//
// SPDX-License-Identifier: MIT
//

import PackageDescription


let package = Package(
    name: "ApodiniAsyncHTTPClient",
    platforms: [
        .macOS(.v12)
    ],
    products: [
        .library(name: "ApodiniAsyncHTTPClient", targets: ["ApodiniAsyncHTTPClient"])
    ],
    dependencies: [
        .package(url: "https://github.com/Apodini/Apodini.git", .upToNextMinor(from: "0.6.1")),
        .package(url: "https://github.com/swift-server/async-http-client.git", from: "1.5.0")
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
