//
//  Copyright © 2022 alexanderpuchta - All rights reserved.
//

import Foundation

enum NewsRouter {
    case fetch(topic: String, language: String)
}


// MARK: - Router

extension NewsRouter: Router {
    
    var keyPath: String? {
        Constants.API.KeyPath.articles
    }
    
    var parameters: [String: Any] {
        switch self {
        case let .fetch(topic, language):
            return [
                Constants.API.ParameterKey.language: language,
                Constants.API.ParameterKey.search: topic
            ]
        }
    }
    
    var path: String {
        Constants.API.Path.all
    }
}


// MARK: - Keys

private extension Constants.API {
    
    enum ParameterKey {
        static let language = "language"
        static let search = "q"
    }
}


// MARK: - KeyPath

private extension Constants.API {
    
    enum KeyPath {
        static let articles = "articles"
    }
}
