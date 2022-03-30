//
//  Copyright © 2022 alexanderpuchta -  All rights reserved.
//

import Combine
import Foundation

protocol NewsServiceRepresentable {
    func fetch() async -> AnyPublisher<[NewsModel], RequestError>
}


final class NewsService {}


// MARK: - HTTPClient

extension NewsService: HTTPClient {}


// MARK: - NewsServiceRepresentable

extension NewsService: NewsServiceRepresentable {
    
    func fetch() async -> AnyPublisher<[NewsModel], RequestError> {
        await self.request(router: NewsRouter.fetch, result: [NewsModel].self)
    }
}
