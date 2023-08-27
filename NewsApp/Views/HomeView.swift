//  /*
//
//  Project: NewsApp
//  File: HometView.swift
//  Created by: Elaidzha Shchukin
//  Date: 27.08.2023
//
//  Status: in progress | Decorated
//
//  */

import SwiftUI
import Kingfisher

struct HometView: View {
    @ObservedObject var viewModel = NewsViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.newsItems) { newsItem in
                NavigationLink(destination: NewsDetailView(newsItem: newsItem)) {
                    HStack {
                        KFImage(URL(string: newsItem.urlToImage ?? ""))
                            .resizable()
                            .frame(width: 100, height: 100)
                        
                        Text(newsItem.title ?? "No Title")
                    }
                }
            }
            .onAppear {
                viewModel.fetchNews()
            }
            .navigationBarTitle("News")
        }
    }
}

