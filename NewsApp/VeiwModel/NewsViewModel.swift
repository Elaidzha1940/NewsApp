//  /*
//
//  Project: NewsApp
//  File: NewsViewModel.swift
//  Created by: Elaidzha Shchukin
//  Date: 27.08.2023
//
//  Status: in progress | Decorated
//
//  */

import Foundation
import Combine

protocol NewsViewModel {
    func getArticles()
}


class NewsViewModelImpl: ObservableObject, NewsViewModel {
    
    private let service: NewsService
    
    private(set) var articles = [Article]()
    private var cancellables = Set<AnyCancellable>()
    
    @Published private(set) var state: ResultState = .loading
    
    init(service: NewsService) {
        self.service = service
        
    }
    
    func getArticles() {
        
        let cancellables = service
            .request(from: .getNews)
            .sink { res in
                switch res {
                    
                case .finished:
                    // Send back the articles
                    break
                case .failure(let error):
                    // Send back the error
                    break
                }
            } receiveValue: { response in
                self.articles = response.articles
            }
        
    }
}
