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
