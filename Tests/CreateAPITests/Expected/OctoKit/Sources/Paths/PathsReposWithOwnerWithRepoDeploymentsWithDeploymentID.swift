// Generated by Create API
// https://github.com/CreateAPI/CreateAPI
//
// swiftlint:disable all

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.Repos.WithOwner.WithRepo.Deployments {
    public func deploymentID(_ deploymentID: Int) -> WithDeploymentID {
        WithDeploymentID(path: "\(path)/\(deploymentID)")
    }

    public struct WithDeploymentID {
        /// Path: `/repos/{owner}/{repo}/deployments/{deployment_id}`
        public let path: String

        /// Get a deployment
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/repos#get-a-deployment)
        public var get: Request<OctoKit.Deployment> {
            Request(method: "GET", url: path)
        }

        /// Delete a deployment
        ///
        /// To ensure there can always be an active deployment, you can only delete an _inactive_ deployment. Anyone with `repo` or `repo_deployment` scopes can delete an inactive deployment.
        /// 
        /// To set a deployment as inactive, you must:
        /// 
        /// *   Create a new deployment that is active so that the system has a record of the current state, then delete the previously active deployment.
        /// *   Mark the active deployment as inactive by adding any non-successful deployment status.
        /// 
        /// For more information, see "[Create a deployment](https://docs.github.com/rest/reference/repos/#create-a-deployment)" and "[Create a deployment status](https://docs.github.com/rest/reference/repos#create-a-deployment-status)."
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/repos#delete-a-deployment)
        public var delete: Request<Void> {
            Request(method: "DELETE", url: path)
        }
    }
}