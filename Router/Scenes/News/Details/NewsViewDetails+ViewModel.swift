//
//  Copyright © 2022 alexanderpuchta - All rights reserved.
//

import Foundation

extension NewsView.DetailView {
    
    final class ViewModel: ObservableObject {
        
        @Published
        var news: NewsModel?
        
        
        // MARK: - Init
        
        init(news: NewsModel) {
            self.news = news
        }
    }
}
