//
//  Copyright © 2022 alexanderpuchta - All rights reserved.
//

import Foundation

extension Bundle {
    
    var apiKey: String? {
        self.string(for: InfoItem.newsAPI)
    }
}


// MARK: - Helper

private extension Bundle {
    
    func string(for key: InfoItem) -> String? {
        self.object(forInfoDictionaryKey: key.rawValue) as? String
    }
}


// MARK: - InfoItem

enum InfoItem: String {
    case newsAPI = "NewsAPIAccess"
}
