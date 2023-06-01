//
//  HTTPClient.swift
//  Tocaan-Task
//
//  Created by Ahmed Fathy on 01/06/2023.
//


import Foundation
import Combine

public protocol HTTPClient {
    func publisher(requester: Requestable) -> AnyPublisher<(Data, HTTPURLResponse), Error>
}
