//
//  Copyright © 2022 alexanderpuchta -  All rights reserved.
//

import Foundation

enum NewsRouter {
    case fetch(topic: String, language: String)
}


// MARK: - Router

extension NewsRouter: Router {
    
    var keyPath: String? {
        "articles"
    }
    
    var parameters: [String: Any] {
        switch self {
        case let .fetch(topic, language):
            return [
                "language": language,
                "q": topic
            ]
        }
    }
    
    var path: String {
        "everything"
    }
}
