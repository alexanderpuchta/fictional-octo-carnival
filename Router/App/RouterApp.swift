//
//  Copyright © 2022 alexanderpuchta - All rights reserved.
//

import SwiftUI

@main
struct RouterApp: App {
    
    @StateObject
    private var coordinator = RootView.Coordinator()
    
    
    // MARK: - Scene
    
    var body: some Scene {
        WindowGroup {
            RootView(coordinator: self.coordinator)
        }
    }
}
