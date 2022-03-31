//
//  Copyright © 2022 alexanderpuchta - All rights reserved.
//

import Foundation

extension SettingsRootView {
    
    final class Coordinator: ObservableObject {
        
        @Published
        var settingsViewModel: SettingsView.ItemView.ViewModel?
        
        @Published
        var viewModel: SettingsView.ViewModel!
        
        private unowned let parent: RootView.Coordinator
        
        
        // MARK: - Init
        
        init(parent: RootView.Coordinator) {
            
            self.parent = parent
            self.viewModel = .init(coordinator: self)
        }
    }
}


// MARK: - Interactions

extension SettingsRootView.Coordinator {
    
    func open(settings: String) {
        self.settingsViewModel = .init(
            item: settings,
            parent: self
        )
    }
    
    func open(url: URL) {
        self.parent.open(url)
    }
}
