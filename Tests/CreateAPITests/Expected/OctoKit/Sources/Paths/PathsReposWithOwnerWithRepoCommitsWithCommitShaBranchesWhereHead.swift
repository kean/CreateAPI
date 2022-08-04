// Generated by Create API
// https://github.com/CreateAPI/CreateAPI
//
// swiftlint:disable all

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.Repos.WithOwner.WithRepo.Commits.WithCommitSha {
    public var branchesWhereHead: BranchesWhereHead {
        BranchesWhereHead(path: path + "/branches-where-head")
    }

    public struct BranchesWhereHead {
        /// Path: `/repos/{owner}/{repo}/commits/{commit_sha}/branches-where-head`
        public let path: String

        /// List branches for HEAD commit
        ///
        /// Protected branches are available in public repositories with GitHub Free and GitHub Free for organizations, and in public and private repositories with GitHub Pro, GitHub Team, GitHub Enterprise Cloud, and GitHub Enterprise Server. For more information, see [GitHub's products](https://help.github.com/github/getting-started-with-github/githubs-products) in the GitHub Help documentation.
        /// 
        /// Returns all branches where the given commit SHA is the HEAD, or latest commit for the branch.
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/repos#list-branches-for-head-commit)
        public var get: Request<[OctoKit.BranchShort]> {
            Request(method: "GET", url: path, id: "repos/list-branches-for-head-commit")
        }
    }
}
