import Foundation

/// A utility used for recording deserialisation issues and warnings
class IssueRecorder {
    struct Issue {
        let type: IssueType
        let key: CodingKey
        let path: [CodingKey]
        let message: String
    }

    enum IssueType {
        case unexpected, deprecated, unsupported
    }

    private(set) var issues: [Issue] = []

    func record(_ type: IssueType, key: CodingKey, path: [CodingKey], message: String = "") {
        issues.append(Issue(type: type, key: key, path: path, message: message))
    }
}

extension IssueRecorder.Issue: CustomStringConvertible {
    var propertyName: String {
        var value = "'\(key.stringValue)'"
        if !path.isEmpty {
            value += " (in '\(path.map(\.stringValue).joined(separator: "."))')"
        }
        return value
    }

    var description: String {
        let summary: String
        switch type {
        case .deprecated:
            summary = "The property \(propertyName) has been deprecated."
        case .unsupported:
            summary = "The property \(propertyName) is no longer supported."
        case .unexpected:
            summary = "Found an unexpected property \(propertyName)."
        }

        if message.isEmpty {
            return summary
        } else {
            return "\(summary) \(message)"
        }
    }
}
