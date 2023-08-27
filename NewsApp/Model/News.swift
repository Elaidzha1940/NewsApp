//  /*
//
//  Project: NewsApp
//  File: News.swift
//  Created by: Elaidzha Shchukin
//  Date: 27.08.2023
//
//  Status: in progress | Decorated
//
//  */

import Foundation

// MARK: - Welcome
struct News: Codable {
    let articles: [Article]
}

// MARK: - Article
struct Article: Codable, Identifiable {
    
    var id = UUID()
    let author: String?
    let url: String
    let source, title, description: String
    let image: String
    let date: Date
}

