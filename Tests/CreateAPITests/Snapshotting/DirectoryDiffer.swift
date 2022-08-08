import Foundation

struct DirectoryDiffer {
    func compare(_ expectedURL: URL, against actualURL: URL) throws {
        // TODO: Rewrite differ and leverage https://github.com/pointfreeco/swift-custom-dump?
        try diff(expectedURL: expectedURL, actualURL: actualURL)
    }
}
