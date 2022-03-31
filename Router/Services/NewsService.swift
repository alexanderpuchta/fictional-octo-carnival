//
//  Copyright © 2022 alexanderpuchta - All rights reserved.
//

import Combine
import Foundation

protocol NewsServiceRepresentable {
    func fetch(topic: String) async -> AnyPublisher<[NewsModel], RequestError>
}


final class NewsService {}


// MARK: - HTTPClient

extension NewsService: HTTPClient {}


// MARK: - NewsServiceRepresentable

extension NewsService: NewsServiceRepresentable {
    
    func fetch(topic: String) async -> AnyPublisher<[NewsModel], RequestError> {
        await self.request(
            router: NewsRouter.fetch(
                topic: topic,
                language: Locale.current.languageCode.orGermany
            ),
            result: [NewsModel].self
        )
    }
}
