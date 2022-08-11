import Foundation

public enum DependencyRule: Decodable {
    case exact(version: String)
    case upToNextMajor(from: String)
    case upToNextMinor(from: String)
    case range(from: String, to: String)
    case closedRange(from: String, to: String)
    case branch(name: String)
    case commit(hash: String)

    var declaration: String {
        switch self {
        case .exact(version: let version):
            return ".exact(\"\(version)\")"
        case .upToNextMajor(from: let version):
            return ".upToNextMajor(from: \"\(version)\")"
        case .upToNextMinor(from: let version):
            return ".upToNextMinor(from: \"\(version)\")"
        case .range(from: let min, to: let max):
            return "\"\(min)\"..<\"\(max)\""
        case .closedRange(from: let min, to: let max):
            return "\"\(min)\"...\"\(max)\""
        case .branch(name: let name):
            return ".branch(\"\(name)\")"
        case .commit(hash: let hash):
            return ".revision(\"\(hash)\")"
        }
    }
}

public struct PackageDeclaration: Decodable {
    
    let url: URL
    let module: String
    var rule: DependencyRule
    
    public var packageDeclaration: String {
        ".package(url: \"\(url)\", \(rule.declaration))"
    }
    
    public var productDeclaration: String {
        let cleanedPackage = url
            .lastPathComponent
            .split(separator: ".")[0]
        
        return ".product(name: \"\(module)\", package: \"\(cleanedPackage)\")"
    }
    
    public init(url: URL, module: String, rule: DependencyRule) {
        self.url = url
        self.module = module
        self.rule = rule
    }
}
