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
            .toolbar {
                ToolbarItem(placement: .navigation) {
                    Text("NewsFeed")
                }
            }
            .navigationBarTitleDisplayMode(.inline)
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
        .searchable(text: self.$viewModel.topic)
    }
}
