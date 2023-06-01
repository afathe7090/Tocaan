//
//  PublisherMapping.swift
//  Tocaan-Task
//
//  Created by Ahmed Fathy on 01/06/2023.
//

import Foundation
import Combine

public extension Publisher where Output == (Data, HTTPURLResponse)  {
    func map<T: Decodable>(_ type: T.Type) -> AnyPublisher<T, Error> {
        return tryMap({ try $0.0.decode(to: type.self) }).eraseToAnyPublisher()
    }
}
