//
//  Copyright © 2022 alexanderpuchta - All rights reserved.
//

import SafariServices
import SwiftUI

struct SafariView: UIViewControllerRepresentable {


    let url: URL

    
    // MARK: - View

    func makeUIViewController(context: Context) -> SFSafariViewController {
        
        let configuration = SFSafariViewController.Configuration()
        configuration.barCollapsingEnabled = false
        return SFSafariViewController(
            url: self.url,
            configuration: configuration
        )
    }

    func updateUIViewController(_ controller: SFSafariViewController, context: Context) {}
}
