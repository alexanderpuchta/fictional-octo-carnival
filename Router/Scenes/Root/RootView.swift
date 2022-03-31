//
//  Copyright © 2022 alexanderpuchta - All rights reserved.
//

import SwiftUI

struct RootView: View {

    @ObservedObject
    var coordinator: Coordinator
    

    // MARK: View

    var body: some View {
        TabView(selection: self.$coordinator.tab) {
            NewsRootView(coordinator: self.coordinator.newsCoordinator)
                .tabItem { Label("News", systemImage: "list.bullet.circle") }
                .tag(TabItem.home)
            
            SettingsRootView(coordinator: self.coordinator.settingsCoordinator)
                .tabItem { Label("Settings", systemImage: "wrench.and.screwdriver") }
                .tag(TabItem.settings)
        }
        .sheet(item: self.$coordinator.url) {
            SafariView(url: $0)
                .edgesIgnoringSafeArea(.all)
        }
    }
}
