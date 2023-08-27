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
import Alamofire
import ObjectMapper

class NewsViewModel: ObservableObject {
    @Published var newsItems: [NewsItemModel] = []
    
    func fetchNews() {
        let apiKey = "https://newsapi.org/v2/everything?q=education" // change your own API Key
        let url = "https://newsapi.org/v2/top-headlines?country=us&apiKey=\(apiKey)"
        
        AF.request(url).responseJSON { response in
            switch response.result {
            case .success(let data):
                if let newsData = data as? [String: Any],
                   let articles = newsData["articles"] as? [[String: Any]] {
                    self.newsItems = Mapper<NewsItemModel>().mapArray(JSONArray: articles)
                }
            case .failure(let error):
                print("Errors when you get data: \(error)")
            }
        }
    }
}
