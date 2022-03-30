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
        }
    }
}


// MARK: - Views

private extension NewsView.DetailView {
    
    var content: some View {
        Text(self.viewModel.id)
    }
}
