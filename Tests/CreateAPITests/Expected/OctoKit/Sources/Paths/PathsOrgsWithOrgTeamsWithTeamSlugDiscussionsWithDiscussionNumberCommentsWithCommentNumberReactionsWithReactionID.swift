// Generated by Create API
// https://github.com/CreateAPI/CreateAPI
//
// swiftlint:disable all

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.Orgs.WithOrg.Teams.WithTeamSlug.Discussions.WithDiscussionNumber.Comments.WithCommentNumber.Reactions {
    public func reactionID(_ reactionID: Int) -> WithReactionID {
        WithReactionID(path: "\(path)/\(reactionID)")
    }

    public struct WithReactionID {
        /// Path: `/orgs/{org}/teams/{team_slug}/discussions/{discussion_number}/comments/{comment_number}/reactions/{reaction_id}`
        public let path: String

        /// Delete team discussion comment reaction
        ///
        /// **Note:** You can also specify a team or organization with `team_id` and `org_id` using the route `DELETE /organizations/:org_id/team/:team_id/discussions/:discussion_number/comments/:comment_number/reactions/:reaction_id`.
        /// 
        /// Delete a reaction to a [team discussion comment](https://docs.github.com/rest/reference/teams#discussion-comments). OAuth access tokens require the `write:discussion` [scope](https://docs.github.com/apps/building-oauth-apps/understanding-scopes-for-oauth-apps/).
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/reactions#delete-team-discussion-comment-reaction)
        public var delete: Request<Void> {
            Request(method: "DELETE", url: path, id: "reactions/delete-for-team-discussion-comment")
        }
    }
}
