//
//  DataDecoderExtension.swift
//  Tocaan-Task
//
//  Created by Ahmed Fathy on 01/06/2023.
//

import Foundation

public extension URLRequest {
    
    init(requester: Requestable) {
        guard let urlComponates = URLComponents(requester: requester),
                  let url = urlComponates.url else {
                      self.init(url: URL(fileURLWithPath: ""))
                      return
                  }
        self.init(url: url)
        
        // Methos
        self.httpMethod = requester.httpMethod.rawValue
        
        // Headers
        requester.headers?.forEach({key, value in
            addValue(value, forHTTPHeaderField: key)
        })
        
        // Body data
        guard case let Task.requestBody(body) = requester.task,
              let httpBody = body.prepareBody()
        else {
            return
        }
      
        self.httpBody = httpBody
    }
}
