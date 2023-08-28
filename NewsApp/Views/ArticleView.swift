//  /*
//
//  Project: NewsApp
//  File: ArticleView.swift
//  Created by: Elaidzha Shchukin
//  Date: 28.08.2023
//
//  S
//
//  */

import SwiftUI
import URLImage

struct ArticleView: View {
    let artile: Article
    
    var body: some View {
        
        HStack {
            
            if let url = artile.image,
               let url = URL(string: url) {
                
                URLImage(url: url,
                         options: URLImageOptions(
                            identifier: artile.id .uuidString,
                            cachePolicy:
                                    .returnStoreElseLoad(cacheDelay: nil, downloadDelay: 0.25)
                         ),
                         content: { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                })
                
            } else {
                
            }
        }
    }
}

struct ArticleView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleView(artile: Article.iData)
    }
}
