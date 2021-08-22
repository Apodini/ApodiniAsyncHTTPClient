<!--

This source file is part of the Apodini AsyncHTTPClient open source project

SPDX-FileCopyrightText: 2021 Paul Schmiedmayer and the project authors (see CONTRIBUTORS.md) <paul.schmiedmayer@tum.de>

SPDX-License-Identifier: MIT

-->

# ApodiniAsyncHTTPClient

[![DOI](https://zenodo.org/badge/374457662.svg)](https://zenodo.org/badge/latestdoi/374457662)
[![codecov](https://codecov.io/gh/Apodini/ApodiniAsyncHTTPClient/branch/develop/graph/badge.svg?token=3qlFhsfUnj)](https://codecov.io/gh/Apodini/ApodiniAsyncHTTPClient)
[![jazzy](https://raw.githubusercontent.com/Apodini/ApodiniAsyncHTTPClient/gh-pages/badge.svg)](https://apodini.github.io/ApodiniAsyncHTTPClient/)
[![Build and Test](https://github.com/Apodini/ApodiniAsyncHTTPClient/actions/workflows/build-and-test.yml/badge.svg)](https://github.com/Apodini/ApodiniAsyncHTTPClient/actions/workflows/build-and-test.yml)

ApodiniAsyncHTTPClient extends [Apodini](https://github.com/Apodini/Apodini) with support for the [AsyncHTTPClient](https://github.com/swift-server/async-http-client) to make HTTP requests in `Handlers` using the Environment: `@Environment(\.httpClient) var httpClient: HTTPClient`.  
For more information about the [AsyncHTTPClient check out the documentation fround in the AsyncHTTPClient repository at https://github.com/swift-server/async-http-client](https://github.com/swift-server/async-http-client).

## Requirements

ApodiniAsyncHTTPClient extends [Apodini](https://github.com/Apodini/Apodini) and can be added as an additional dependency to your Swift Package manifest (`Package.swift`):
```swift
dependencies: [
    .package(url: "https://github.com/Apodini/ApodiniAsyncHTTPClient.git", from: "0.1.0"),
    // And more Swift Package dependencies ...
],
```
You can use the dependency in your Apodini target as follows:
```swift
.target(
    name: "MyApodiniWebService",
    dependencies: [
        .product(name: "Apodini", package: "Apodini"),
        .product(name: "ApodiniAsyncHTTPClient", package: "ApodiniAsyncHTTPClient"),
        // And more dependencies for the target ...
    ]
),
```

## Usage


You can use the [AsyncHTTPClient](https://github.com/swift-server/async-http-client) to make HTTP requests in `Handlers` using the Environment: `@Environment(\.httpClient) var httpClient: HTTPClient`:
```swift
import Apodini
import ApodiniAsyncHTTPClient


struct CreateContact: Handler {
    @Environment(\.httpClient)
    var httpClient: HTTPClient
    
    
    func handle() throws -> EventLoopFuture<String> {
        httpClient
            .get(url: "https://github.com/Apodini/ApodiniAsyncHTTPClient")
            .map { response in
                guard response.status == .ok else {
                    return "❌"
                }
                return "ApodiniAsyncHTTPClient 🚀"
            }
    }
}

```
For more information about the [AsyncHTTPClient check out the documentation fround in the AsyncHTTPClient repository at https://github.com/swift-server/async-http-client](https://github.com/swift-server/async-http-client).


## Contributing
Contributions to this project are welcome. Please make sure to read the [contribution guidelines](https://github.com/Apodini/.github/blob/main/CONTRIBUTING.md) and the [contributor covenant code of conduct](https://github.com/Apodini/.github/blob/main/CODE_OF_CONDUCT.md) first

## License
This project is licensed under the MIT License. See [License](https://github.com/Apodini/ApodiniAsyncHTTPClient/blob/develop/LICENSE) for more information.
