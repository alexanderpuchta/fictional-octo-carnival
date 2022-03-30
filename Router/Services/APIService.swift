//
//  Copyright © 2022 alexanderpuchta -  All rights reserved.
//

import Foundation

protocol APIService {
    
    var baseURL: URL { get }
    var components: URLComponents { get }
    var method: HTTPMethod { get }
    var parameters: [String: Any] { get }
    var path: String { get }
    
    func asURLRequest() throws -> URLRequest
}


// MARK: - HTTPMethod

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
}
