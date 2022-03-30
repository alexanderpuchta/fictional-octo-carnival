//
//  Copyright © 2022 alexanderpuchta -  All rights reserved.
//

import Foundation

enum TabItem {
    case favorites
    case home
    case settings
}


// MARK: - RootView+Coordinator

extension RootView {
    
    final class Coordinator: ObservableObject {
        
        @Published
        var newsCoordinator: NewsRootView.Coordinator!
        
        @Published
        var settingsCoordinator: SettingsRootView.Coordinator!
        
        @Published
        var tab: TabItem = .home
        
        @Published
        var url: URL?
        
        
        // MARK: - Init
        
        init() {
            
            self.newsCoordinator = .init(parent: self)
            self.settingsCoordinator = .init(parent: self)
        }
    }
}


// MARK: - Interactions

extension RootView.Coordinator {
    
    func open(_ url: URL) {
        self.url = url
    }
}
