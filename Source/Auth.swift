///
/// Auto-generated by Stone, do not modify.
///

import Foundation

/// Datatypes and serializers for the auth namespace
public class Auth {
    /// Errors occurred during authentication.
    public enum AuthError: CustomStringConvertible {
        /// The access token is invalid.
        case InvalidAccessToken
        /// The user specified in 'Dropbox-API-Select-User' is no longer on the team.
        case InvalidSelectUser
        /// The user specified in 'Dropbox-API-Select-Admin' is not a Dropbox Business team admin.
        case InvalidSelectAdmin
        /// An unspecified error.
        case Other

        public var description: String {
            return "\(SerializeUtil.prepareJSONForSerialization(AuthErrorSerializer().serialize(self)))"
        }
    }
    public class AuthErrorSerializer: JSONSerializer {
        public init() { }
        public func serialize(value: AuthError) -> JSON {
            switch value {
                case .InvalidAccessToken:
                    var d = [String: JSON]()
                    d[".tag"] = .Str("invalid_access_token")
                    return .Dictionary(d)
                case .InvalidSelectUser:
                    var d = [String: JSON]()
                    d[".tag"] = .Str("invalid_select_user")
                    return .Dictionary(d)
                case .InvalidSelectAdmin:
                    var d = [String: JSON]()
                    d[".tag"] = .Str("invalid_select_admin")
                    return .Dictionary(d)
                case .Other:
                    var d = [String: JSON]()
                    d[".tag"] = .Str("other")
                    return .Dictionary(d)
            }
        }
        public func deserialize(json: JSON) -> AuthError {
            switch json {
                case .Dictionary(let d):
                    let tag = Serialization.getTag(d)
                    switch tag {
                        case "invalid_access_token":
                            return AuthError.InvalidAccessToken
                        case "invalid_select_user":
                            return AuthError.InvalidSelectUser
                        case "invalid_select_admin":
                            return AuthError.InvalidSelectAdmin
                        case "other":
                            return AuthError.Other
                        default:
                            return AuthError.Other
                    }
                default:
                    fatalError("Failed to deserialize")
            }
        }
    }

    /// Error occurred because the app is being rate limited.
    public class RateLimitError: CustomStringConvertible {
        /// The reason why the app is being rate limited.
        public let reason: Auth.RateLimitReason
        /// The number of seconds that the app should wait before making another request.
        public let retryAfter: UInt64
        public init(reason: Auth.RateLimitReason, retryAfter: UInt64 = 1) {
            self.reason = reason
            comparableValidator()(retryAfter)
            self.retryAfter = retryAfter
        }
        public var description: String {
            return "\(SerializeUtil.prepareJSONForSerialization(RateLimitErrorSerializer().serialize(self)))"
        }
    }
    public class RateLimitErrorSerializer: JSONSerializer {
        public init() { }
        public func serialize(value: RateLimitError) -> JSON {
            let output = [ 
            "reason": Auth.RateLimitReasonSerializer().serialize(value.reason),
            "retry_after": Serialization._UInt64Serializer.serialize(value.retryAfter),
            ]
            return .Dictionary(output)
        }
        public func deserialize(json: JSON) -> RateLimitError {
            switch json {
                case .Dictionary(let dict):
                    let reason = Auth.RateLimitReasonSerializer().deserialize(dict["reason"] ?? .Null)
                    let retryAfter = Serialization._UInt64Serializer.deserialize(dict["retry_after"] ?? .Null)
                    return RateLimitError(reason: reason, retryAfter: retryAfter)
                default:
                    fatalError("Type error deserializing")
            }
        }
    }

    /// The RateLimitReason union
    public enum RateLimitReason: CustomStringConvertible {
        /// You are making too many requests in the past few minutes.
        case TooManyRequests
        /// There are currently too many write operations happening in the user's Dropbox.
        case TooManyWriteOperations
        /// An unspecified error.
        case Other

        public var description: String {
            return "\(SerializeUtil.prepareJSONForSerialization(RateLimitReasonSerializer().serialize(self)))"
        }
    }
    public class RateLimitReasonSerializer: JSONSerializer {
        public init() { }
        public func serialize(value: RateLimitReason) -> JSON {
            switch value {
                case .TooManyRequests:
                    var d = [String: JSON]()
                    d[".tag"] = .Str("too_many_requests")
                    return .Dictionary(d)
                case .TooManyWriteOperations:
                    var d = [String: JSON]()
                    d[".tag"] = .Str("too_many_write_operations")
                    return .Dictionary(d)
                case .Other:
                    var d = [String: JSON]()
                    d[".tag"] = .Str("other")
                    return .Dictionary(d)
            }
        }
        public func deserialize(json: JSON) -> RateLimitReason {
            switch json {
                case .Dictionary(let d):
                    let tag = Serialization.getTag(d)
                    switch tag {
                        case "too_many_requests":
                            return RateLimitReason.TooManyRequests
                        case "too_many_write_operations":
                            return RateLimitReason.TooManyWriteOperations
                        case "other":
                            return RateLimitReason.Other
                        default:
                            return RateLimitReason.Other
                    }
                default:
                    fatalError("Failed to deserialize")
            }
        }
    }


    /// Stone Route Objects

    static let tokenRevoke = Route(
        name: "token/revoke",
        namespace: "auth",
        deprecated: false,
        argSerializer: Serialization._VoidSerializer,
        responseSerializer: Serialization._VoidSerializer,
        errorSerializer: Serialization._VoidSerializer,
        attrs: ["host": "api",
                "style": "rpc"]
    )
}