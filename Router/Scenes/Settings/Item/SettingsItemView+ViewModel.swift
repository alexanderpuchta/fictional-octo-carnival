//
//  Copyright © 2022 alexanderpuchta -  All rights reserved.
//

import Foundation

extension SettingsView.ItemView {
    
    final class ViewModel: ObservableObject {
        
        @Published
        var item: String = ""
        
        private unowned let parent: SettingsRootView.Coordinator
        
        
        // MARK: - Init
        
        init(
            item: String,
            parent: SettingsRootView.Coordinator
        ) {
            
            self.parent = parent
            self.item = item
        }
    }
}


// MARK: - Interactions

extension SettingsView.ItemView.ViewModel {
    
    func open() {
        
        guard let url = URL(string: "https://www.github.com") else {
            return
        }
        
        self.parent.open(url: url)
    }
}
