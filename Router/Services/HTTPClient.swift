//
//  Copyright © 2022 alexanderpuchta -  All rights reserved.
//

import Combine
import Foundation

protocol HTTPClient {
    func request<T: Decodable>(router: Router, result: T.Type) async -> AnyPublisher<T, RequestError>
}


extension HTTPClient {
    
    func request<T: Decodable>(router: Router, result: T.Type) async -> AnyPublisher<T, RequestError> {
        
        guard var urlComponents = URLComponents(string: router.baseURL + router.path) else {
            return Fail(error: RequestError.invalidURL)
                .eraseToAnyPublisher()
        }
        
        urlComponents.queryItems = router.parameters.map { key, value in
            URLQueryItem(
                name: key,
                value: "\(value)"
            )
        }
        
        guard let url = urlComponents.url else {
            return Fail(error: RequestError.invalidURL)
                .eraseToAnyPublisher()
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = router.method.rawValue
        request.allHTTPHeaderFields = router.header
        
        do {
            
            let (data, response) = try await URLSession.shared.data(for: request)
            
            guard let response = response as? HTTPURLResponse else {
                return Fail(error: RequestError.noResponse)
                    .eraseToAnyPublisher()
            }
            
            switch response.statusCode {
            case 200 ... 299:
                
                let jsonData: Data = try {
                    
                    if let keyPath = router.keyPath {
                        
                        let topLevel = try JSONSerialization.jsonObject(with: data)
                        
                        if let nestedJson = (topLevel as AnyObject).value(forKeyPath: keyPath) {
                            return try JSONSerialization.data(withJSONObject: nestedJson)
                        } else {
                            throw RequestError.decode
                        }
                    } else {
                        return data
                    }
                }()
                
                guard let decodedResponse = try? JSONDecoder().decode(result, from: jsonData) else {
                    return Fail(error: RequestError.decode)
                        .eraseToAnyPublisher()
                }
                
                return Just(decodedResponse)
                    .setFailureType(to: RequestError.self)
                    .eraseToAnyPublisher()
                
            case 401:
                return Fail(error: RequestError.unauthorized)
                    .eraseToAnyPublisher()
                
            default:
                return Fail(error: RequestError.unknown)
                    .eraseToAnyPublisher()
            }
            
        } catch {
            return Fail(error: RequestError.unknown)
                .eraseToAnyPublisher()
        }
    }
}
