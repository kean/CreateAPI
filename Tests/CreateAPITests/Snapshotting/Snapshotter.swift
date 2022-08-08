import Foundation

private let generateSnapshots = false

class Snapshotter {
    enum Behavior {
        case assert, record
    }

    static let shared = Snapshotter(behavior: generateSnapshots ? .record : .assert)

    let behavior: Behavior
    private(set) var recordedSnapshots: [URL]
    private let fileManager: FileManager

    private init(behavior: Behavior) {
        self.behavior = behavior
        self.recordedSnapshots = []
        self.fileManager = .default
    }

    /// Processes a snapshot at the given path by either asserting a match against a stored snapshot, or rewriting it.
    func processSnapshot(at generatedURL: URL, against name: String) throws {
        let snapshotURL = snapshotLocation(for: name)

        switch behavior {
        case .assert:
            try DirectoryDiffer().compare(snapshotURL, against: generatedURL)

        case .record:
            try resetAllSnapshotsIfNeeded()
            try resetDirectory(at: snapshotURL, create: false)
            try fileManager.copyItem(at: generatedURL, to: snapshotURL)
            recordedSnapshots.append(snapshotURL)
        }
    }

    /// The location of a generated snapshot stored on disk
    private func snapshotLocation(for name: String) -> URL {
        snapshotDirectory.appendingPathComponent(name)
    }

    /// Deletes the contents of the snapshot directory if it was already there in preparation to re-record all outputs
    private func resetAllSnapshotsIfNeeded() throws {
        guard shouldResetAllSnapshots else { return }
        try resetDirectory(at: snapshotDirectory)
    }

    private var shouldResetAllSnapshots: Bool {
        guard recordedSnapshots.isEmpty else { return false }
        return true // TODO: Don't reset snapshot directory when only running a subset of tests
    }

    /// The URL to the snapshot storage directory
    var snapshotDirectory: URL {
        URL(fileURLWithPath: #filePath)
            .appendingPathComponent("..")
            .appendingPathComponent("..")
            .appendingPathComponent("Expected")
            .resolvingSymlinksInPath()
    }

    /// Deletes and recreates the directory at the given location.
    private func resetDirectory(at url: URL, create: Bool = true) throws {
        if fileManager.fileExists(atPath: url.path) {
            try fileManager.removeItem(at: url)
        }

        if create {
            try fileManager.createDirectory(at: url, withIntermediateDirectories: true)
        }
    }
}
