//
//  Copyright © 2022 alexanderpuchta -  All rights reserved.
//

import Combine
import Foundation

protocol NewsServiceRepresentable {
    func getNews() async -> AnyPublisher<[NewsModel], APIServiceError>
}


// MARK: - NewsService

final class NewsService {}


// MARK: - APIService

extension NewsService: APIService {
    
    var baseURL: URL {
        URL(string: "https://newsapi.org/v2/")!
    }
    
    var components: URLComponents {
        
        var components = URLComponents(string: self.baseURL.absoluteString)!
        components.path = self.path
        return components
    }
    
    var method: HTTPMethod {
        .get
    }
    
    var parameters: [String: Any] {
        [
            "apiKey": "1b9b71083e6542cabcb6715db5aff362",
            "language": "de",
            "q": "bitcoin"
        ]
    }
    
    var path: String {
        "everything"
    }
    
    func asURLRequest() throws -> URLRequest {
        
        let finalURL = self.baseURL.appendingPathComponent(self.path)
        
        guard var components = URLComponents(string: finalURL.absoluteString) else {
            throw APIServiceError.invalid
        }
        
        components.queryItems = self.parameters.map { key, value in
            URLQueryItem(name: key, value: String(describing: value))
        }
        var urlRequest = URLRequest(url: components.url ?? self.baseURL)
        urlRequest.httpMethod = self.method.rawValue
        
        return urlRequest
    }
}

enum APIServiceError: Error {
    case invalid
}

// MARK: - NewsServiceRepresentable

extension NewsService: NewsServiceRepresentable {
    
    func getNews() async -> AnyPublisher<[NewsModel], APIServiceError> {
        
        do {
            
            let (data, _) = try await URLSession.shared.data(for: self.asURLRequest())
            
            let topLevel = try JSONSerialization.jsonObject(with: data)
            
            guard let nested = (topLevel as AnyObject).value(forKeyPath: "articles") else {
                return Fail(error: APIServiceError.invalid)
                    .eraseToAnyPublisher()
            }
            
            let jsonData = try JSONSerialization.data(withJSONObject: nested)
            let response = try JSONDecoder().decode([NewsModel].self, from: jsonData)
            
            return Just(response)
                .setFailureType(to: APIServiceError.self)
                .eraseToAnyPublisher()
        } catch {
            return Fail(error: APIServiceError.invalid)
                .eraseToAnyPublisher()
        }
    }
}
