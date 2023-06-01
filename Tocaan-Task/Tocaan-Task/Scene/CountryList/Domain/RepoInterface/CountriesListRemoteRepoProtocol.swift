//
//  CountriesListRemoteRepoProtocol.swift
//  Tocaan-Task
//
//  Created by Ahmed Fathy on 01/06/2023.
//

import Combine

protocol CountriesListRemoteRepoProtocol {
    func load() -> AnyPublisher<Response, Error>
}
