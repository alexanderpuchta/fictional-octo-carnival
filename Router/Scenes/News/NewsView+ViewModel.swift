//
//  Copyright © 2022 alexanderpuchta -  All rights reserved.
//

import Foundation

extension NewsView {
    
    final class ViewModel: ObservableObject {
        
        @Published
        private(set) var news = [String]()
        
        private unowned let coordinator: NewsRootView.Coordinator
        
        
        // MARK: - Init
        
        init(coordinator: NewsRootView.Coordinator) {
            
            self.coordinator = coordinator
            self.news.append("Test!!!")
        }
    }
}


// MARK: - Interaction

extension NewsView.ViewModel {
    
    func details(_ news: String) {
        self.coordinator.open(news: news)
    }
}
