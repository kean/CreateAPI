import XCTest
@testable import create_api

class GenerateTestCase: XCTestCase {   
    var temp: TemporaryDirectory!
    let snapshotter: Snapshotter = .shared
    let compiler: PackageCompiler = .shared
    
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
        testCompilationOnLinux: Bool = true,
        arguments: [String] = [],
        configuration: String? = nil
    ) throws {
        let outputURL = temp.url
            .appendingPathComponent("Output")

        // Append the output, and spec to the arguments passed
        var arguments = arguments
        arguments.append(contentsOf: [
            "--output", outputURL.path,
            spec.path
        ])

        // If a configuration file was defined, also write that to a temporary directory and add it to the args
        if let configuration = configuration {
            arguments.append(contentsOf: ["--config", config(configuration, ext: "yml")])
        }

        // If a module name wasn't already specified, use the `name` so that all packages have a unique module name
        if !arguments.contains(where: { $0.starts(with: "module") }) {
            arguments.append(contentsOf: ["--config-option", "module=\(name)"])
        }

        // Run the generator with the given arguments
        let command = try Generate.parse(arguments)
        try command.run()

        // Then the output should match what was generated
        let snapshotURL = try snapshotter.processSnapshot(at: outputURL, against: name)

        // If we snapshotted a package in record mode then include it in compiler tests
        if case .record = snapshotter.behavior, let name = try PackageManifest.productName(in: snapshotURL) {
            compiler.addPackage(at: snapshotURL, name: name, supportsLinux: testCompilationOnLinux)
        }
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
