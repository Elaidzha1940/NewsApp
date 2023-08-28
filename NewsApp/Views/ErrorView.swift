//  /*
//
//  Project: NewsApp
//  File: ErrorView.swift
//  Created by: Elaidzha Shchukin
//  Date: 28.08.2023
//
//  Status: in progress | Decorated
//
//  */

import SwiftUI

struct ErrorView: View {
   
    
    
    typealias ErrorViewActionHandler = () -> Void
    
    let error = Error.self
    let handler: ErrorViewActionHandler
    
    internal init(error: Error,
                  handler: @escaping ErrorView.ErrorViewActionHandler) {
        self.handler = handler
    }
    
    var body: some View {
        
        VStack {
            Image(systemName: "exclamtionmark.icloud.fill")
                .foregroundColor(.red)
                .font(.system(size: 40, weight: .bold, design: .rounded))
                .padding(.bottom, 5)
            
            Text("Ooops")
                .foregroundColor(.red)
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .multilineTextAlignment(.center)
            
            Text("Error: \(error.localizedDescription)")
                .foregroundColor(.red)
                .font(.system(size: 20, weight: .bold, design: .rounded))
                .multilineTextAlignment(.center)
                .padding(.vertical, 5)
            
            Button {
                handler()
            } label: {
                Text("Retry")
            }
            .padding(.vertical, 12)
            .padding(.horizontal, 30)
            .background(Color.red)
            .foregroundColor(.white)
            .font(.system(size: 20, weight: .bold, design: .rounded))
            .cornerRadius(20)

        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(error: APIError.decodingError) {}
            .previewLayout(.sizeThatFits)
    }
}
