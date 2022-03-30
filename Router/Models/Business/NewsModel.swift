//
//  Copyright © 2022 alexanderpuchta -  All rights reserved.
//

import Foundation

struct NewsModel {
    let id: String
    let image: URL?
    let subtitle: String
    let title: String
    
    
    // MARK: - Init
    
    init(
        id: String = UUID().uuidString,
        title: String,
        subtitle: String,
        imageURL: String = ""
    ) {
        
        self.id = id
        self.image = URL(string: imageURL)
        self.subtitle = subtitle
        self.title = title
    }
}


// MARK: - Identifiable

extension NewsModel: Identifiable {}


// MARK: - Mock

extension NewsModel {
    
    static var all: [Self] {
        [
            self.news1,
            self.news2,
            self.news3
        ]
    }
    
    static var news1: Self {
        Self(
            title: "Energie-Streit",
            subtitle: "Rubel-Umstellung für russisches Gas noch nicht am Donnerstag",
            imageURL: "https://assets.deutschlandfunk.de/4649e67b-29c9-4503-88f0-8f6a34fcfa5e/1920x1080.jpg?t=1646053976455"
        )
    }
    
    static var news2: Self {
        Self(
            title: "Bundeskabinett",
            subtitle: "Abschlussbericht zur Hochwasserkatastrophe zieht kritische Bilanz",
            imageURL: "https://assets.deutschlandfunk.de/FILE_e706632dca65052fc9fc881239706109/1920x1080.jpg?t=1631257969842"
        )
    }
    
    static var news3: Self {
        Self(
            title: "Lawrow in China",
            subtitle: "Moskau und Peking bekräftigen enge Partnerschaft",
            imageURL: "https://assets.deutschlandfunk.de/FILE_1ad086d57e990c37a209a64d0ac3eefe/1920x1080.jpg?t=1616502524967"
        )
    }
}
