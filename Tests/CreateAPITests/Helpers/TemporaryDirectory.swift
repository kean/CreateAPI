import Foundation

struct TemporaryDirectory {
    let url: URL

    init() {
        url = FileManager.default.temporaryDirectory
            .appendingPathComponent(UUID().uuidString, isDirectory: true)
        try? FileManager.default.createDirectory(at: url, withIntermediateDirectories: true, attributes: nil)
    }

    func remove() {
        try? FileManager.default.removeItem(at: url)
    }
    
    func path(for name: String) -> String {
        url.appendingPathComponent(name).path
    }
}
