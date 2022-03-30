//
//  Copyright © 2022 alexanderpuchta -  All rights reserved.
//

import Combine
import Foundation

extension NewsView {
    
    final class ViewModel: ObservableObject {
        
        @Published
        private(set) var news = [NewsModel]()
        
        private var cancellables = Set<AnyCancellable>()
        private unowned let coordinator: NewsRootView.Coordinator
        private let manager: NewsManagerRepresentable
        
        
        // MARK: - Init
        
        init(
            coordinator: NewsRootView.Coordinator,
            manager: NewsManagerRepresentable = NewsManager()
        ) {
            
            self.coordinator = coordinator
            self.manager = manager
            
            self.fetchNews()
        }
    }
}


// MARK: - Interaction

extension NewsView.ViewModel {
    
    func details(_ news: NewsModel) {
        self.coordinator.open(news: news)
    }
}


// MARK: - Helper

private extension NewsView.ViewModel {
    
    func fetchNews() {
        Task {
            await self.manager.fetch()
                .receive(on: DispatchQueue.main)
                .sink { completion in
                    switch completion {
                    case let .failure(error):
                        print("*** ERR", error.localizedDescription)
                        
                    case .finished:
                        print("*** finished \(#function)")
                    }
                } receiveValue: { [weak self] response in
                    self?.news = response
                }
                .store(in: &self.cancellables)
        }
    }
}
