//
//  Copyright © 2022 alexanderpuchta -  All rights reserved.
//

import Foundation

extension NewsRootView {
    
    final class Coordinator: ObservableObject {
        
        @Published
        var detailViewModel: NewsView.DetailView.ViewModel?
        @Published
        var viewModel: NewsView.ViewModel!
        
        private unowned let parent: RootView.Coordinator
        
        
        // MARK: - Init
        
        init(parent: RootView.Coordinator) {
            
            self.parent = parent
            self.viewModel = .init(coordinator: self)
        }
    }
}


// MARK: - Interactions

extension NewsRootView.Coordinator {
    
    func closeNews() {
        self.detailViewModel = nil
    }
    
    func open(news: NewsModel) {
        self.detailViewModel = .init(news: news)
    }
}
