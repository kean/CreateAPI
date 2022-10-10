// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import NaiveDate
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.User {
  public var logout: Logout {
    Logout(path: path + "/logout")
  }

  public struct Logout {
    /// Path: `/user/logout`
    public let path: String

    /// Logs out current logged in user session
    public var get: Request<Void> {
      Request(path: path, method: "GET", id: "logoutUser")
    }
  }
}
