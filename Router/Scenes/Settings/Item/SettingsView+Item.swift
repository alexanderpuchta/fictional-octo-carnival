//
//  Copyright © 2022 alexanderpuchta -  All rights reserved.
//

import SwiftUI

extension SettingsView {
    
    struct ItemView: View {
        
        @ObservedObject
        var viewModel: ViewModel
        
        
        // MARK: - View
        
        var body: some View {
            self.content
        }
    }
}


// MARK: - Views

private extension SettingsView.ItemView {
    
    var content: some View {
        Text(self.viewModel.item)
            .frame(
                width: 300,
                height: 300
            )
            .clipShape(Rectangle())
            .onTapGesture(perform: self.openWebsite)
    }
}


// MARK: Helper

private extension SettingsView.ItemView {
    
    func openWebsite() {
        self.viewModel.open()
    }
}
