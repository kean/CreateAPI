# Advanced Setup

Looking for examples that push CreateAPI to it's limits? Well look no further.

<!-- Be sure to update this TOC when adding new sections! -->
- [Using a different API Client](#using-a-different-api-client)

## Using a different API Client

While using [Get](https://github.com/kean/get) is the easiest way to get started with CreateAPI, you might want to integrate CreateAPI with a different client instead.

To do this, there are two important steps that need following:

1. Exclude the `Get` import in the generated paths
2. Write a matching `Request` type

### Exclude the `Get` import

Using the [`paths.imports`](./ConfigOptions.md#pathsimports) option, override the default value (`["Get"]`) to omit the import:

**.create-api.yaml**
```yaml
paths:
  # Ensure that Get is not imported in generated source files
  imports: []
```

### Write a matching `Request` type

The generated code needs to initialize a type called `Request` to define all of the path parameters and response type. When importing Get, `Request` was already available to the generated code but after removing the import, this will no longer be the case.

You should either add a new `Request` type to the module of the generated code, or import one from a different module (be sure to update `paths.imports` if so). The type should have the same interface as [Get's `Request` type](https://github.com/kean/Get/blob/899db7397eacddad384fc252d79b804c0801072c/Sources/Get/Request.swift#L11-L118):

```swift
struct Request<Response> {
    var method: String = "GET"
    var url: String
    var query: [(String, String?)]?
    var body: Encodable?
    var headers: [String: String]?
    var id: String?
}
```

The generated Paths will provide configured instances of this `Request` type that you can then pass into your own API client instead.
