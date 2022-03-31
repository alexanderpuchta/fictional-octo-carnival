//
//  Copyright © 2022 alexanderpuchta - All rights reserved.
//

import Foundation

protocol Router {
    
    var baseURL: String { get }
    var header: [String: String] { get }
    var keyPath: String? { get }
    var method: HTTPMethod { get }
    var parameters: [String: Any] { get }
    var path: String { get }
}


extension Router {
    
    var baseURL: String {
        Constants.API.baseURL
    }
    
    var header: [String: String] {
        
        guard let apiKey = Bundle.main.apiKey else {
            return [:]
        }
        
        return [
            Constants.API.Header.auth: "\(Constants.API.Header.bearer) \(apiKey)"
        ]
    }
    
    var keyPath: String? {
        nil
    }
    
    var method: HTTPMethod {
        .get
    }
}


// MARK: - HTTPMethod

enum HTTPMethod: String {
    case delete = "DELETE"
    case get = "GET"
    case patch = "PATCH"
    case post = "POST"
    case put = "PUT"
}


// MARK: - RequestError

enum RequestError: Error {
    case decode
    case invalidURL
    case noResponse
    case unauthorized
    case unknown
}


// MARK: - API+Header

private extension Constants.API {
    
    enum Header {
        static let auth = "Authorization"
        static let bearer = "Bearer"
    }
}
