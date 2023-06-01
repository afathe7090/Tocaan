//
//  URLSessionHTTPClientPublisher.swift
//  Tocaan-Task
//
//  Created by Ahmed Fathy on 01/06/2023.
//

import Foundation
import Combine

public struct URLSessionHTTPClientPublisher: HTTPClient {
    public struct InvalidHTTPRespnseError: Error {}
    private let session: URLSession
    
    public init(session: URLSession = URLSession.shared) {
        self.session = session
    }
    
    public func publisher(requester: Requestable) -> AnyPublisher<(Data, HTTPURLResponse), Error> {
        return dataTaskPublisher(from: requester)
            .tryMap { result in
                guard let response = result.response as? HTTPURLResponse else {
                    throw InvalidHTTPRespnseError()
                }
                return (result.data, response)
            }
            .eraseToAnyPublisher()
    }
    
    private func dataTaskPublisher(from requester: Requestable) -> URLSession.DataTaskPublisher {
        return session.dataTaskPublisher(for: URLRequest(requester: requester))
    }
}
