//
//  Copyright © 2022 alexanderpuchta -  All rights reserved.
//

import SwiftUI

struct SettingsView: View {
    
    @ObservedObject
    var viewModel: ViewModel
    
    
    // MARK: - View
    
    var body: some View {
        self.content
    }
}


// MARK: - Views

private extension SettingsView {
    
    var content: some View {
        List(self.viewModel.settings, id: \.self) { item in
            Text(item)
                .fontWeight(.bold)
                .onNavigation { self.viewModel.open(item: item) } 
        }
    }
}
