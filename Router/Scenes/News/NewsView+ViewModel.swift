//
//  Copyright © 2022 alexanderpuchta - All rights reserved.
//

import Combine
import Foundation

extension NewsView {
    
    final class ViewModel: ObservableObject {
        
        @Published
        private(set) var news = [NewsModel]()
        
        @Published
        var topic: String = ""
        
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
            
            self.setupPublisher()
        }
    }
}


// MARK: - Interaction

extension NewsView.ViewModel {
    
    func details(_ news: NewsModel) {
        self.coordinator.open(news: news)
    }
}


// MARK: - Publisher

private extension NewsView.ViewModel {
    
    func setupPublisher() {
        self.$topic
            .debounce(
                for: 0.25,
                scheduler: RunLoop.main
            )
            .sink { [weak self] topic in
                self?.fetchNews(with: topic)
            }
            .store(in: &self.cancellables)
    }
}


// MARK: - Helper

private extension NewsView.ViewModel {
    
    func fetchNews(with topic: String) {
        Task {
            await self.manager.fetch(topic: topic)
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
