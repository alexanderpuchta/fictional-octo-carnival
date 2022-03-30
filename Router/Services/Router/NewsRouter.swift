//
//  Copyright © 2022 alexanderpuchta -  All rights reserved.
//

import Foundation

enum NewsRouter {
    case fetch
}


// MARK: - Router

extension NewsRouter: Router {
    
    var keyPath: String? {
        "articles"
    }
    
    var parameters: [String: Any] {
        [
            "language": "de",
            "q": "bitcoin"
        ]
    }
    
    var path: String {
        "everything"
    }
}
