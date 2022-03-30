//
//  Copyright © 2022 alexanderpuchta -  All rights reserved.
//

import Foundation

extension NewsView.DetailView {
    
    final class ViewModel: ObservableObject {
        
        @Published
        var id: String = ""
        
        
        // MARK: - Init
        
        init(id: String) {
            self.id = id
        }
    }
}
