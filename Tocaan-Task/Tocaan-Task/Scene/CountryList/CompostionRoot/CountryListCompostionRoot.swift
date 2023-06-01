//
//  CountryListCompostionRoot.swift
//  Tocaan-Task
//
//  Created by Ahmed Fathy on 01/06/2023.
//

import SwiftUI
import UIKit
import Infrastructure

struct CountryListCompostionRoot {
    enum Root{
        case uiKit
        case swiftUI
    }
    static func compose(root: Root = .uiKit) -> UIViewController  {
        let viewModel = CountryListViewModelCompostionRoot.compose()
        let uiKit = CountriesListViewController(viewModel: viewModel)
        let swiftUI = UIHostingController(rootView: CountriesListView(viewModel: viewModel))
        return root == .uiKit ?  uiKit:swiftUI
    }
}

struct CountryListViewModelCompostionRoot{
    static func compose() -> CountriesListViewModel {
        let client = URLSessionHTTPClientPublisher()
        let repo = CountriesListRemoteRepostitory(clint: client)
        let useCase = CountriesListUseCase(repo: repo)
        return CountriesListViewModel(useCase: useCase)
    }
}
