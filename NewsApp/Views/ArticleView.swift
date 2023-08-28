//  /*
//
//  Project: NewsApp
//  File: ArticleView.swift
//  Created by: Elaidzha Shchukin
//  Date: 28.08.2023
//
//  Status: in progress | Decorated
//
//  */

import SwiftUI
import URLImage

struct ArticleView: View {
    let article: Article
    
    var body: some View {
        
        HStack {
            
            if let imgUrl = article.image,
               let url = URL(string: imgUrl) {
                
                URLImage(url: url,
                         options: URLImageOptions(
                            identifier: article,
                            cachePolicy: .returnStoreElseLoad(downloadDelay: 0.25)
                         ),
                         failure: { error, _ in
                    
                    Image(systemName: "photo,fill")
                        .foregroundColor(.red)
                        .background(Color.red)
                        .frame(width: 100, height: 100)
                },
                         content: { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                })
                .frame(width: 100, height: 100)
                .cornerRadius(20)

            } else {
                
                Image(systemName: "photo,fill")
                    .foregroundColor(.red)
                    .background(Color.red)
                    .frame(width: 100, height: 100)
            }
        }
    }
}

struct ArticleView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleView(article: Article.iData)
    }
}
