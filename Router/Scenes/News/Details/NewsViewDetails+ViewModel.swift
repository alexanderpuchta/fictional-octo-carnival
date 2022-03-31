//
//  Copyright © 2022 alexanderpuchta - All rights reserved.
//

import Foundation

extension NewsView.DetailView {
    
    final class ViewModel: ObservableObject {
        
        @Published
        var news: NewsModel?
        
        private unowned let coordinator: NewsRootView.Coordinator
        
        
        // MARK: - Init
        
        init(
            news: NewsModel,
            coordinator: NewsRootView.Coordinator
        ) {
            
            self.coordinator = coordinator
            self.news = news
        }
    }
}


// MARK: - Interactions

extension NewsView.DetailView.ViewModel {
    
    func openURL() {
        self.coordinator.open(url: self.news?.url)
    }
}
