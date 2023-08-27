//  /*
//
//  Project: NewsApp
//  File: ResultState.swift
//  Created by: Elaidzha Shchukin
//  Date: 27.08.2023
//
//  Status: in progress | Decorated
//
//  */

import Foundation

enum ResultState {
    
    case loading
    case success(content: [Article])
    case failed(error: Error)
}
