//
//  CountriesListUseCase.swift
//  Tocaan-Task
//
//  Created by Ahmed Fathy on 01/06/2023.
//

import Combine

protocol CountriesListUseCaseProtocol {
    func loadCountries() -> AnyPublisher<[Country], Error>
}

final class CountriesListUseCase: CountriesListUseCaseProtocol{
    private let repo: CountriesListRemoteRepoProtocol
    
    init(repo: CountriesListRemoteRepoProtocol) {
        self.repo = repo
    }
    
    func loadCountries() -> AnyPublisher<[Country], Error> {
        repo.load().map(\.data).dispatchOnMainQueue().eraseToAnyPublisher()
    }
}
