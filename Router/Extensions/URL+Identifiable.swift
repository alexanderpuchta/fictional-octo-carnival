//
//  Copyright © 2022 alexanderpuchta - All rights reserved.
//

import Foundation

extension URL: Identifiable {

    public var id: String {
        self.absoluteString
    }
}
