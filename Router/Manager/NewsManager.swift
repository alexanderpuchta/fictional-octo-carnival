//
//  Copyright © 2022 alexanderpuchta -  All rights reserved.
//

import Combine
import Foundation

protocol NewsManagerRepresentable {
    func fetch(topic: String) async -> AnyPublisher<[NewsModel], RequestError>
}


// MARK: - NewsManager

final class NewsManager {
    
    private let service: NewsServiceRepresentable
    
    
    // MARK: - Init
    
    init(service: NewsServiceRepresentable = NewsService()) {
        self.service = service
    }
}


// MARK: - NewsManagerRepresentable

extension NewsManager: NewsManagerRepresentable {
    
    func fetch(topic: String) async -> AnyPublisher<[NewsModel], RequestError> {
        await self.service
            .fetch(topic: topic)
            .eraseToAnyPublisher()
    }
}
