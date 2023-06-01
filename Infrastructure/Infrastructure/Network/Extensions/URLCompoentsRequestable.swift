//
//  URLCompoentsRequestable.swift
//  Tocaan-Task
//
//  Created by Ahmed Fathy on 01/06/2023.
//

import Foundation

public extension URLComponents {
    init?(requester: Requestable) {
        let url = requester.baseUrl.appendingPathComponent(requester.path)
        self.init(url: url, resolvingAgainstBaseURL: false)
        
        // Parameters
        guard case let Task.requestParameters(parameter) = requester.task else {
            return
        }
        queryItems = parameter.map(QueryItemsParamaterMapper.map)
    }
}
