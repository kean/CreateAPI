import XCTest
@testable import create_api

class GenerateTestCase: XCTestCase {
    struct SpecFixture {
        let name: String
        let ext: String

        static let cookpad = SpecFixture(name: "cookpad", ext: "json")
        static let discriminator = SpecFixture(name: "discriminator", ext: "yaml")
        static let edgecases = SpecFixture(name: "edgecases", ext: "yaml")
        static let github = SpecFixture(name: "github", ext: "yaml")
        static let inlining = SpecFixture(name: "inlining", ext: "yaml")
        static let petstore = SpecFixture(name: "petstore", ext: "yaml")
        static let stripParentNameNestedObjects = SpecFixture(name: "strip-parent-name-nested-objects", ext: "yaml")
        static let testQueryParameters = SpecFixture(name: "test-query-parameters", ext: "yaml")

        var path: String {
            URL(fileURLWithPath: #filePath)
                .appendingPathComponent("..")
                .appendingPathComponent("..")
                .appendingPathComponent("Support")
                .appendingPathComponent("Specs")
                .appendingPathComponent(name)
                .appendingPathExtension(ext)
                .resolvingSymlinksInPath()
                .path
        }
    }
    
    var temp: TemporaryDirectory!
    let snapshotter: Snapshotter = .shared
    
    override func setUp() {
        super.setUp()
        
        temp = TemporaryDirectory()
    }
    
    override func tearDown() {
        super.tearDown()
        
        temp.remove()
    }

    func snapshot(
        spec: SpecFixture,
        name: String, // TODO: Default to #function
        arguments: [String] = [],
        configuration: String? = nil
    ) throws {
        let outputURL = temp.url
            .appendingPathComponent("Output")

        // Append the output, config and spec to the arguments passed
        var arguments = arguments
        arguments.append(contentsOf: ["--output", outputURL.path])
        if let configuration = configuration {
            arguments.append(contentsOf: ["--config", self.config(configuration, ext: "yml")])
        }
        arguments.append(spec.path)

        // Run the generator with the given arguments
        try generate(arguments)

        // Then the output should match what was generated
        try snapshotter.processSnapshot(at: outputURL, against: name)
    }

    func generate(_ arguments: [String]) throws {
        try Generate.parse(arguments).run()
    }
    
    private func config(_ contents: String, ext: String = "json") -> String {
        let url = URL(fileURLWithPath: temp.path(for: "config.\(ext)"))
        try! contents.data(using: .utf8)!.write(to: url)
        return url.path
    }
}
