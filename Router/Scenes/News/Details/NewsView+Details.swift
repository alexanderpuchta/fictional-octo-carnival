//
//  Copyright © 2022 alexanderpuchta -  All rights reserved.
//

import SwiftUI

extension NewsView {
    
    struct DetailView: View {
        
        @ObservedObject
        var viewModel: ViewModel
        
        
        // MARK: - View
        
        var body: some View {
            self.content
                .toolbar {
                    ToolbarItem(placement: .navigation) {
                        Text(self.title)
                    }
                }
        }
    }
}


// MARK: - Properties

private extension NewsView.DetailView {
    
    var title: String {
        self.viewModel.news?.title ?? ""
    }
}


// MARK: - Views

private extension NewsView.DetailView {
    
    var content: some View {
        ScrollView {
            self.viewModel.news.map { news in
                LazyVStack(alignment: .leading, pinnedViews: [.sectionHeaders]) {
                    Section(header: self.headerView) {
                    
                        VStack(alignment: .leading, spacing: 24) {
                            Text(news.subtitle)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.leading)
                                .fixedSize(
                                    horizontal: false,
                                    vertical: true
                                )
                            
                            Divider()
                            
                            Text(news.body)
                                .font(.body)
                                .multilineTextAlignment(.leading)
                                .fixedSize(
                                    horizontal: false,
                                    vertical: true
                                )
                        }
                        .padding(24)
                    }
                }
            }
        }
    }
    
    var headerView: some View {
        self.viewModel.news.map { news in
            AsyncImage(url: news.image) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                ProgressView()
            }
        }
    }
}
