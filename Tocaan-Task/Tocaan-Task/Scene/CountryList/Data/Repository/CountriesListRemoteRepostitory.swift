//
//  CountriesListRemoteRepostitory.swift
//  Tocaan-Task
//
//  Created by Ahmed Fathy on 01/06/2023.
//

import Combine
import Infrastructure

final class CountriesListRemoteRepostitory: CountriesListRemoteRepoProtocol {
    private let clint: HTTPClient
    
    init(clint: HTTPClient) {
        self.clint = clint
    }
    
    func load() -> AnyPublisher<Response, Error> {
        clint.publisher(requester: CountryListRequestable())
            .tryMap(CountriesMapper.map)
            .eraseToAnyPublisher()
    }
}
