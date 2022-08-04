// Generated by Create API
// https://github.com/CreateAPI/CreateAPI
//
// swiftlint:disable all

import Foundation
import NaiveDate

struct ContainerB: Codable {
    var child: Child

    struct Child: Codable {
        var `enum`: Enum
        var renameMe: String
        var child: Child

        enum Enum: String, Codable, CaseIterable {
            case a
            case b
        }

        struct Child: Codable {
            var `enum`: Enum
            var renameMe: String

            enum Enum: String, Codable, CaseIterable {
                case a
                case b
            }

            init(`enum`: Enum, renameMe: String) {
                self.enum = `enum`
                self.renameMe = renameMe
            }

            private enum CodingKeys: String, CodingKey {
                case `enum`
                case renameMe = "rename-me"
            }
        }

        init(`enum`: Enum, renameMe: String, child: Child) {
            self.enum = `enum`
            self.renameMe = renameMe
            self.child = child
        }

        private enum CodingKeys: String, CodingKey {
            case `enum`
            case renameMe = "rename-me"
            case child
        }
    }

    init(child: Child) {
        self.child = child
    }
}