// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.Repos.WithOwner.WithRepo.Pages {
    public var health: Health {
        Health(path: path + "/health")
    }

    public struct Health {
        /// Path: `/repos/{owner}/{repo}/pages/health`
        public let path: String

        /// Get a DNS health check for GitHub Pages
        ///
        /// Gets a health check of the DNS settings for the `CNAME` record configured for a repository's GitHub Pages.
        /// 
        /// The first request to this endpoint returns a `202 Accepted` status and starts an asynchronous background task to get the results for the domain. After the background task completes, subsequent requests to this endpoint return a `200 OK` status with the health check results in the response.
        /// 
        /// Users must have admin or owner permissions. GitHub Apps must have the `pages:write` and `administration:write` permission to use this endpoint.
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/repos#get-a-dns-health-check-for-github-pages)
        public var get: Request<OctoKit.PagesHealthCheck> {
            Request(path: path, method: "GET", id: "repos/get-pages-health-check")
        }
    }
}
