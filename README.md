# ApodiniAsyncHTTPClient

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
Contributions to this projects are welcome. Please make sure to read the [contribution guidelines](https://github.com/Apodini/.github/blob/release/CONTRIBUTING.md) first.

## License
This project is licensed under the MIT License. See [License](https://github.com/Apodini/Template-Repository/blob/release/LICENSE) for more information.
