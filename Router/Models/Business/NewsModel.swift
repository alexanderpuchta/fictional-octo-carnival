//
//  Copyright © 2022 alexanderpuchta - All rights reserved.
//

import Foundation

struct NewsModel: Codable {
    let body: String
    let id: String
    let image: URL?
    let subtitle: String
    let title: String
    let url: URL?
    
    
    // MARK: - Init
    
    init(
        title: String,
        subtitle: String,
        body: String,
        imageURL: String = "",
        articleURL: String = ""
    ) {
        
        self.body = body
        self.id = UUID().uuidString
        self.image = URL(string: imageURL)
        self.subtitle = subtitle
        self.title = title
        self.url = URL(string: articleURL)
    }
    
    
    // MARK: - CodingKeys
    
    enum CodingKeys: String, CodingKey {
        case body = "content"
        case id = "publishedAt"
        case image = "urlToImage"
        case subtitle = "description"
        case title
        case url
    }
}


// MARK: - Identifiable

extension NewsModel: Identifiable {}


extension NewsModel {
    
    var cleaned: String {
        if let range = self.body.range(of: "…") {
            return "\(self.body.prefix(upTo: range.lowerBound))"
        }
        return self.body
    }
}
