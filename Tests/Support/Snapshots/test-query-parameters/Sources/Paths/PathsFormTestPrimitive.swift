// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import URLQueryEncoder

extension Paths.Form {
    public var testPrimitive: TestPrimitive {
        TestPrimitive(path: path + "/test-primitive")
    }

    public struct TestPrimitive {
        /// Path: `/form/test-primitive`
        public let path: String

        /// Test passing primitive query parameters
        public func get(parameters: GetParameters) -> Request<Void> {
            Request(path: path, method: "GET", query: parameters.asQuery)
        }

        public struct GetParameters {
            public var id: Int?
            public var id2: Int
            public var id3: Int

            public init(id: Int? = nil, id2: Int, id3: Int) {
                self.id = id
                self.id2 = id2
                self.id3 = id3
            }

            public var asQuery: [(String, String?)] {
                let encoder = URLQueryEncoder()
                encoder.encode(id, forKey: "id")
                encoder.encode(id2, forKey: "id2")
                encoder.encode(id3, forKey: "id3")
                return encoder.items
            }
        }

        /// Inlining simple queries
        public func post(name: String) -> Request<Void> {
            Request(path: path, method: "POST", query: [("name", name)])
        }

        /// Inlining more complex queries (with an enum)
        public func patch(type: `Type`) -> Request<Void> {
            Request(path: path, method: "PATCH", query: makePatchQuery(type))
        }

        private func makePatchQuery(_ type: `Type`) -> [(String, String?)] {
            let encoder = URLQueryEncoder()
            encoder.encode(type, forKey: "type")
            return encoder.items
        }

        public enum `Type`: String, Codable, CaseIterable {
            case cat
            case dog
        }
    }
}
