//
//  Copyright © 2022 alexanderpuchta -  All rights reserved.
//

import SwiftUI

struct SettingsRootView: View {

    @ObservedObject
    var coordinator: SettingsRootView.Coordinator

    
    // MARK: View

    var body: some View {
        NavigationView {
            SettingsView(viewModel: self.coordinator.viewModel)
                .navigation(item: self.$coordinator.settingsViewModel) { viewModel in
                    SettingsView.ItemView(viewModel: viewModel)
                }
        }
    }
}
