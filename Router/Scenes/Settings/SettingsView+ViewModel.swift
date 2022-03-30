//
//  Copyright © 2022 alexanderpuchta -  All rights reserved.
//

import Foundation

extension SettingsView {
    
    final class ViewModel: ObservableObject {
        
        @Published
        private(set) var settings = [String]()
        
        private unowned let coordinator: SettingsRootView.Coordinator
        
        
        // MARK: - Init
        
        init(coordinator: SettingsRootView.Coordinator) {
            
            self.coordinator = coordinator
            
            self.settings.append(contentsOf: [
                "Allgemein",
                "Benachrichtigungen"
            ])
        }
    }
}


// MARK: - Interactions

extension SettingsView.ViewModel {
    
    func open(item: String) {
        self.coordinator.open(settings: item)
    }
    
    func open(url: URL) {
        self.coordinator.open(url: url)
    }
}
