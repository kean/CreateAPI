import ArgumentParser

@main
struct CreateAPI: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "create-api",
        abstract: "A Swift command-line tool to auto-generate code for OpenAPI specs",
        version: "0.0.5",
        subcommands: [Generate.self]
    )
}
