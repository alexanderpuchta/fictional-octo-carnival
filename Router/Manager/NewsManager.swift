//
//  Copyright © 2022 alexanderpuchta -  All rights reserved.
//

import Combine
import Foundation

protocol NewsManagerRepresentable {
    func fetch() async -> AnyPublisher<[NewsModel], APIServiceError>
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
    
    func fetch() async -> AnyPublisher<[NewsModel], APIServiceError> {
        await self.service
            .getNews()
            .eraseToAnyPublisher()
    }
}
