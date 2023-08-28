//  /*
//
//  Project: NewsApp
//  File: ArticleView.swift
//  Created by: Elaidzha Shchukin
//  Date: 28.08.2023
//
//  Status: in progress | Not decorated
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
                            identifier: article.id.uuidString,
                            cachePolicy: .returnStoreElseLoad(cachDelay: nil, downloadDelay: 0.25)
                         ),
                         failure: { error, _ in
                    PlaceholderImageView()
                },
                         content: { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                })
                .frame(width: 100, height: 100)
                .cornerRadius(20)
                
            } else {
                PlaceholderImageView()
            }
            
            VStack(alignment: .leading, spacing: 5) {
                
                Text(article.title ?? "")
                    .foregroundColor(.red)
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                
                Text(article.source ?? "N/A")
                    .foregroundColor(.red)
                    .font(.footnote)
            }
        }
    }
}

struct PlaceholderImageView: View {
    var body: some View {
        
        Image(systemName: "photo,fill")
            .foregroundColor(.red)
            .background(Color.red)
            .frame(width: 100, height: 100)
    }
}

struct ArticleView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleView(article: Article.iData)
            .previewLayout(.sizeThatFits)
    }
}
