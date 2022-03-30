//
//  Copyright © 2022 alexanderpuchta -  All rights reserved.
//

import SwiftUI

struct SheetModifier<Item: Identifiable, Destination: View>: ViewModifier {
    
    private let destination: (Item) -> Destination
    private let item: Binding<Item?>

    
    // MARK: - Init

    init(
        item: Binding<Item?>,
        @ViewBuilder content: @escaping (Item) -> Destination
    ) {
        
        self.destination = content
        self.item = item
    }

    
    // MARK: - View

    func body(content: Content) -> some View {
        content.sheet(item: item, content: destination)
    }

}
