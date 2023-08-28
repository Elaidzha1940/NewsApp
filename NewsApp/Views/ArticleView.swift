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
import 

struct ArticleView: View {
    let artile: Article
    
    var body: some View {
        
        HStack {
            
            if let imgUrl = artile.image,
               let url = URL(string: imgUrl) {
                
                KFImage(url,
                        content: { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 80, height: 80)
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
