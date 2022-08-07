#if !canImport(Combine)
import ConfigurationParser
import Foundation
import Yams

extension YAMLDecoder: TopLevelDecoder {
    public typealias Input = Data

    public func decode<T>(_ type: T.Type, from: Data) throws -> T where T: Decodable {
        try decode(type, from: from, userInfo: [:])
    }
}
#endif
