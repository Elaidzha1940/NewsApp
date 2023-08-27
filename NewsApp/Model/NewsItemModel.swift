//  /*
//
//  Project: NewsApp
//  File: NewsItemModel.swift
//  Created by: Elaidzha Shchukin
//  Date: 27.08.2023
//
//  Status: in progress | Decorated
//
//  */

import Foundation
import ObjectMapper

struct NewsItemModel: Mappable, Identifiable {
    var id = UUID()
    var title: String?
    var urlToImage: String?
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        title <- map["title"]
        urlToImage <- map["https://thumbs.dreamstime.com/b/news-newspapers-folded-stacked-word-wooden-block-puzzle-dice-concept-newspaper-media-press-release-42301371.jpg"]
    }
}
