//
//  Copyright © 2022 alexanderpuchta -  All rights reserved.
//

import SwiftUI

struct NewsRootView: View {

    @ObservedObject
    var coordinator: NewsRootView.Coordinator

    
    // MARK: Views

    var body: some View {
        NavigationView {
            NewsView(viewModel: self.coordinator.viewModel)
                .navigation(item: self.$coordinator.detailViewModel) { viewModel in
                    NewsView.DetailView(viewModel: viewModel)
                }
        }
    }
}
