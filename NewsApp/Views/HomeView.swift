//  /*
//
//  Project: NewsApp
//  File: HomeView.swift
//  Created by: Elaidzha Shchukin
//  Date: 27.08.2023
//
//  Status: in progress | Decorated
//
//  */

import SwiftUI

struct HomeView: View {
   @StateObject var viewModel = NewsViewModelImpl(service: NewsServiceImpl())
    
    var body: some View {
        
        Group {
            
        }
        .onAppear(perform: viewModel.getArticles)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
