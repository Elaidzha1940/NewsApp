//  /*
//
//  Project: NewsApp
//  File: News.swift
//  Created by: Elaidzha Shchukin
//  Date: 27.08.2023
//
//  Status: in progress | Decorated
//
//  */

import Foundation

// MARK: - Welcome
struct News: Codable {
    let articles: [Article]
}

// MARK: - Article
struct Article: Codable, Identifiable {
    
    var id = UUID()
    let author: String?
    let url: String?
    let source, title, description: String?
    let image: String?
    let date: Date?
    
    enum CodingKey: String {
        
        case author, url, source, title
        case articledescription = "description"
        case image, date
    }
}

extension Article {
    
    static var iData: Article {
        
        .init(author: "Aimee Lewis, Alex Stambaugh, Al Goodman, Gerardo Lemos",
              url: "https://www.cnn.com/2023/08/26/sport/spain-football-federation-legal-action-jennifer-hermoso-spt-intl/index.html",
              source: "CNN",
              title: "Luis Rubiales: Spain's football federation threatens legal action against Women's World Cup winner Jennifer Hermoso - CNN",
              description: "Spain’s football federation has threatened to take legal action against one of the country’s star players, Jennifer Hermoso, accusing her of lying about being kissed by federation president Luis Rubiales.",
              image: "https://media.cnn.com/api/v1/images/stellar/prod/230825205323-rubiales-jenni-hermoso-polemica-futbol-perspectivas-mexico-tv-00000000.png?c=16x9&q=w_800,c_fill",
              date: Date())
    }
}

/*
 {
          "author": "Aimee Lewis, Alex Stambaugh, Al Goodman, Gerardo Lemos",
          "url": "https://www.cnn.com/2023/08/26/sport/spain-football-federation-legal-action-jennifer-hermoso-spt-intl/index.html",
          "source": "CNN",
          "title": "Luis Rubiales: Spain's football federation threatens legal action against Women's World Cup winner Jennifer Hermoso - CNN",
          "description": "Spain’s football federation has threatened to take legal action against one of the country’s star players, Jennifer Hermoso, accusing her of lying about being kissed by federation president Luis Rubiales.",
          "image": "https://media.cnn.com/api/v1/images/stellar/prod/230825205323-rubiales-jenni-hermoso-polemica-futbol-perspectivas-mexico-tv-00000000.png?c=16x9&q=w_800,c_fill",
          "date": "2023-08-26T11:13:00Z"
      },
 */
