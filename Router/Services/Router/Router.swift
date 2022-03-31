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
        "https://newsapi.org/v2/"
    }
    
    var header: [String: String] {
        [
            "Authorization": "Bearer 1b9b71083e6542cabcb6715db5aff362"
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
