# Dependencies

By default, CreateAPI will use [Get](https://github.com/kean/Get) for the API client. If you are generating a package, this dependency is setup for you automatically but if you are generating for an existing module, you will need to manage dependencies yourself.

Below is a table that describes dependencies that CreateAPI generated code might need to use:

Dependency|Minimum Version|Required When?
---|---|---
[Get](https://github.com/kean/Get)|1.0.0|Generating Paths*
[URLQueryEncoder](https://github.com/CreateAPI/URLQueryEncoder)|0.0.2|Generating paths with query parameters
[HTTPHeaders](https://github.com/CreateAPI/HTTPHeaders)|0.1.0|[`isGeneratingResponseHeaders`](https://github.com/CreateAPI/CreateAPI/blob/main/Docs/ConfigOptions.md#pathsisgeneratingresponseheaders) is set to `true` (the default)
[NaiveDate](https://github.com/CreateAPI/NaiveDate)|1.0.0|[`isNaiveDateEnabled`](https://github.com/CreateAPI/CreateAPI/blob/main/Docs/ConfigOptions.md#isnaivedateenabled) is set to `true` (the default)


> **Note**: _*If you are already using a different API client and don't want to have to depend on Get, check out the [Advanced Setup](./AdvancedSetup.md#using-a-different-api-client) documentation._
