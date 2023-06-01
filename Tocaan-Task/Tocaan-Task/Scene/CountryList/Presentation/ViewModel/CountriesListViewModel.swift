//
//  CountriesListViewModel.swift
//  Tocaan-Task
//
//  Created by Ahmed Fathy on 01/06/2023.
//

import Combine

final class CountriesListViewModel: ObservableObject {
    
    enum Bind {
        case reloadAll
        case reloadSection(Int)
    }
    // MARK: - UseCase
    private let useCase: CountriesListUseCaseProtocol
    
    // MARK: - Proberties
    @Published var countries: [Country] = []
    var cities: [City] {
        guard countries.count != 0 else { return []}
        return countries[0].cities
    }
    let bindPublisher: PassthroughSubject<Bind, Never> = PassthroughSubject()
    private var anyCancellable = Set<AnyCancellable>()
    
    // MARK: - Init
    init(useCase: CountriesListUseCaseProtocol) {
        self.useCase = useCase
        loadCountries()
    }
    
    // MARK: - Load Countries
    private func loadCountries() {
        useCase.loadCountries().sink { completion in
            switch completion {
            case .failure(let error):
                print(error.localizedDescription)
            case .finished:
                print("finished")
            }
        } receiveValue: { [weak self] countries in
            self?.countries = countries
            self?.bindPublisher.send(.reloadAll)
        }.store(in: &anyCancellable)

    }
    
}
