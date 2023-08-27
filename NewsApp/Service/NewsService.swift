//  /*
//
//  Project: NewsApp
//  File: NewsService.swift
//  Created by: Elaidzha Shchukin
//  Date: 27.08.2023
//
//  Status: in progress | Decorated
//
//  */

import Foundation
import Combine

protocol NewsService {
    
    func request(from endpoint: NewsAPI) -> AnyPublisher<News, APIError>
}

struct NewsServiceImpl: NewsService {
    
    func request(from endpoint: NewsAPI) -> AnyPublisher<News, APIError> {
        
        return URLSession
            .shared
            .dataTaskPublisher(for: endpoint.urlRequest)
            .receive(on: DispatchQueue.main)
            .mapError { _ in APIError.unknown }
            .flatMap { data, response -> AnyPublisher<News, APIError> in
                
                guard let response = response as? HTTPURLResponse else {
                    return Fail(error: APIError.unknown).eraseToAnyPublisher()
                }
                
                if (200...299).contains(response.statusCode) {
                    let jsonDecoder = JSONDecoder()
                    jsonDecoder.dateDecodingStrategy = .iso8601
                    
                    return Just(data)
                        .decode(type: News.self, decoder: jsonDecoder)
                        .mapError { _ in APIError.decodingError}
                        .eraseToAnyPublisher()
                    
                } else {
                    return Fail(error:
                                    APIError.errorCode(response.statusCode)).eraseToAnyPublisher()
                }
            }
            .eraseToAnyPublisher()
    }
}
