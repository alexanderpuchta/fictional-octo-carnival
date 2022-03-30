//
//  Copyright © 2022 alexanderpuchta -  All rights reserved.
//

import Foundation

extension NewsView {
    
    final class ViewModel: ObservableObject {
        
        @Published
        private(set) var news = [NewsModel]()
        
        private unowned let coordinator: NewsRootView.Coordinator
        
        
        // MARK: - Init
        
        init(coordinator: NewsRootView.Coordinator) {
            
            self.coordinator = coordinator
            self.news.append(contentsOf: NewsModel.all)
        }
    }
}


// MARK: - Interaction

extension NewsView.ViewModel {
    
    func details(_ news: NewsModel) {
        self.coordinator.open(news: news)
    }
}
