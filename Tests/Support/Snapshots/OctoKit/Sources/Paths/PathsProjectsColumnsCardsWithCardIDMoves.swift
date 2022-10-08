// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.Projects.Columns.Cards.WithCardID {
    public var moves: Moves {
        Moves(path: path + "/moves")
    }

    public struct Moves {
        /// Path: `/projects/columns/cards/{card_id}/moves`
        public let path: String

        /// Move a project card
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/projects#move-a-project-card)
        public func post(_ body: PostRequest) -> Request<Void> {
            Request(path: path, method: "POST", body: body, id: "projects/move-card")
        }

        public struct PostRequest: Encodable {
            /// The position of the card in a column. Can be one of: `top`, `bottom`, or `after:<card_id>` to place after the specified card.
            ///
            /// Example: "bottom"
            public var position: String
            /// The unique identifier of the column the card should be moved to
            ///
            /// Example: 42
            public var columnID: Int?

            public init(position: String, columnID: Int? = nil) {
                self.position = position
                self.columnID = columnID
            }

            public func encode(to encoder: Encoder) throws {
                var values = encoder.container(keyedBy: StringCodingKey.self)
                try values.encode(position, forKey: "position")
                try values.encodeIfPresent(columnID, forKey: "column_id")
            }
        }
    }
}
