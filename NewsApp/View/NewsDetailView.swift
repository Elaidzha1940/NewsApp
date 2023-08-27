//  /*
//
//  Project: NewsApp
//  File: NewsDetailView.swift
//  Created by: Elaidzha Shchukin
//  Date: 27.08.2023
//
//  Status: in progress | Decorated
//
//  */

import Foundation
import SwiftUI
import Kingfisher
import ObjectMapper

struct NewsDetailView: View {
    var newsItem: NewsItemModel
    
    var body: some View {
        
        VStack {
            KFImage(URL(string: newsItem.urlToImage ?? "https://thumbs.dreamstime.com/b/news-newspapers-folded-stacked-word-wooden-block-puzzle-dice-concept-newspaper-media-press-release-42301371.jpg"))
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity, maxHeight: 200)
            
            Text(newsItem.title ?? "News")
                .font(.title)
                .padding()
        }
        .navigationBarTitle("Details of News")
    }
}

struct NewsDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NewsDetailView(newsItem: NewsItemModel(map: Map))
    }
}
