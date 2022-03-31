//
//  Copyright © 2022 alexanderpuchta - All rights reserved.
//

import Foundation

// MARK: - String

extension Optional where Wrapped == String {
    
    var orGermany: String {
        self ?? "de"
    }
}
