//
//  Copyright © 2022 alexanderpuchta -  All rights reserved.
//

import SwiftUI

struct NewsView: View {
    
    @ObservedObject
    var viewModel: ViewModel
    
    
    // MARK: - View
    
    var body: some View {
        self.content
    }
}


// MARK: - Views

private extension NewsView {
    
    var content: some View {
        List(self.viewModel.news) { news in
            Text(news.title)
                .fontWeight(.bold)
                .onNavigation { self.viewModel.details(news) }
        }
    }
}
