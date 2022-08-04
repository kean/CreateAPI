// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.Enterprises.WithEnterprise.Actions.Runners {
    public var downloads: Downloads {
        Downloads(path: path + "/downloads")
    }

    public struct Downloads {
        /// Path: `/enterprises/{enterprise}/actions/runners/downloads`
        public let path: String

        /// List runner applications for an enterprise
        ///
        /// Lists binaries for the runner application that you can download and run.
        /// 
        /// You must authenticate using an access token with the `manage_runners:enterprise` scope to use this endpoint.
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/enterprise-admin#list-runner-applications-for-an-enterprise)
        public var get: Request<[OctoKit.RunnerApplication]> {
            Request(method: "GET", url: path, id: "enterprise-admin/list-runner-applications-for-enterprise")
        }
    }
}
