//
//  Copyright © 2022 alexanderpuchta -  All rights reserved.
//

import Foundation

struct NewsModel: Codable {
    let body: String
    let id: String
    let image: URL?
    let subtitle: String
    let title: String
    
    
    // MARK: - Init
    
    init(
        id: String = UUID().uuidString,
        title: String,
        subtitle: String,
        body: String,
        imageURL: String = ""
    ) {
        
        self.body = body
        self.id = id
        self.image = URL(string: imageURL)
        self.subtitle = subtitle
        self.title = title
    }
    
    enum CodingKeys: String, CodingKey {
        case body = "content"
        case id = "publishedAt"
        case image = "urlToImage"
        case subtitle = "description"
        case title
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
            body: "Russland rückt von seiner Forderung nach einer sofortigen Zahlung für russische Gaslieferungen in Rubel ab. Wie Kreml-Sprecher Peskow in Moskau mitteilte, wird die Umstellung von Euro und Dollar auf Rubel nicht wie geplant morgen in Kraft treten.\nDie Umstellung sei ein technologisch zeitaufwendiger Prozess und solle schrittweise erfolgen. Die Regierung, die Zentralbank und das Gasunternehmen Gazprom sollten nun Vorschläge zur Ausführung vorlegen.\nRusslands Präsident Putin hatte die Zahlung in Rubel gefordert und mit einem Lieferstopp gedroht, sollten die belieferten Unternehmen dem nicht nachkommen. Die sieben führenden Industriestaaten hatten dies einheitlich abgelehnt.",
            imageURL: "https://assets.deutschlandfunk.de/4649e67b-29c9-4503-88f0-8f6a34fcfa5e/1920x1080.jpg?t=1646053976455"
        )
    }
    
    static var news2: Self {
        Self(
            title: "Bundeskabinett",
            subtitle: "Abschlussbericht zur Hochwasserkatastrophe zieht kritische Bilanz",
            body: "Achteinhalb Monate nach der Hochwasserkatastrophe in Deutschland müssen die Menschen in den am stärksten betroffenen Regionen immer noch mit Einschränkungen leben.\nDas geht aus einem im Bundeskabinett vorgestellten Abschlussbericht der Bundesregierung zu den Starkregenereignissen in Rheinland-Pfalz, Nordrhein-Westfalen, Sachsen und Bayern Mitte Juli vergangenen Jahres hervor. Demnach sind die Arbeiten an den zerstörten Leitungsnetzen noch nicht abgeschlossen. In Ausnahmefällen seien daher noch Unterbrechungen der Trinkwasserversorgung möglich. Auch im Mobilfunknetz könne es an einigen Standorten Einschränkungen geben. Teilweise bestehe kein Zugang zum Festnetz.\nZudem beschloss das Kabinett einen Bonus für Pflegekräfte in Kliniken und in der Altenpflege. Dafür wird eine Milliarde Euro bereitgestellt. Das Geld soll je zur Hälfte an Krankenhäuser und in die Altenpflege gehen.",
            imageURL: "https://assets.deutschlandfunk.de/FILE_e706632dca65052fc9fc881239706109/1920x1080.jpg?t=1631257969842"
        )
    }
    
    static var news3: Self {
        Self(
            title: "Lawrow in China",
            subtitle: "Moskau und Peking bekräftigen enge Partnerschaft",
            body: "Russland und China wollen ihre enge Partnerschaft weiter ausbauen.\nIm chinesischen Tunxi kam Russlands Außenminister Lawrow am Rande einer Afghanistan-Konferenz mit seinem chinesischen Amtskollegen Wang Yi zusammen. In einer gemeinsamen Erklärung hoben beide Seiten die Qualität der Beziehungen und den Wunsch nach einem Ausbau der Kooperation hervor. Konkrete Maßnahmen wurden nicht genannt.\nEigentlicher Anlass der Begegnung zwischen Lawrow und Wang sind Gespräche über die Entwicklung in Afghanistan auf Einladung Chinas. An den Beratungen nehmen auch Vertreter der USA, der Nachbarstaaten und der seit August herrschenden Taliban-Regierung teil.",
            imageURL: "https://assets.deutschlandfunk.de/FILE_1ad086d57e990c37a209a64d0ac3eefe/1920x1080.jpg?t=1616502524967"
        )
    }
}
