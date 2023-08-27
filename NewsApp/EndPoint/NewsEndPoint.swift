//  /*
//
//  Project: NewsApp
//  File: NewsEndPoint.swift
//  Created by: Elaidzha Shchukin
//  Date: 27.08.2023
//
//  Status: in progress | Decorated
//
//  */

import Foundation

protocol APIBuilder {
    
    var urlRequest: URLRequest { get }
    var baseUrl: URL { get }
    var path: String { get }
}
