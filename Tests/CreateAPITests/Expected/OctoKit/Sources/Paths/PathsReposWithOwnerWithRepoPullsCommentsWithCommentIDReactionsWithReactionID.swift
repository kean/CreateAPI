// Generated by Create API
// https://github.com/CreateAPI/CreateAPI
//
// swiftlint:disable all

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.Repos.WithOwner.WithRepo.Pulls.Comments.WithCommentID.Reactions {
    public func reactionID(_ reactionID: Int) -> WithReactionID {
        WithReactionID(path: "\(path)/\(reactionID)")
    }

    public struct WithReactionID {
        /// Path: `/repos/{owner}/{repo}/pulls/comments/{comment_id}/reactions/{reaction_id}`
        public let path: String

        /// Delete a pull request comment reaction
        ///
        /// **Note:** You can also specify a repository by `repository_id` using the route `DELETE /repositories/:repository_id/pulls/comments/:comment_id/reactions/:reaction_id.`
        /// 
        /// Delete a reaction to a [pull request review comment](https://docs.github.com/rest/reference/pulls#review-comments).
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/reactions#delete-a-pull-request-comment-reaction)
        public var delete: Request<Void> {
            Request(method: "DELETE", url: path, id: "reactions/delete-for-pull-request-comment")
        }
    }
}
