//
//  CountriesListView.swift
//  Tocaan-Task
//
//  Created by Ahmed Fathy on 01/06/2023.
//

import SwiftUI

struct CountriesListView: View {
    
    @StateObject var viewModel: CountriesListViewModel
    
    var body: some View {
        
        // MARK: - Countries
        List(viewModel.countries) { county in
            DisclosureGroup(county.title) {
                // MARK: - Cities
                ForEach(county.cities) { city in
                    DisclosureGroup(city.title){
                        
                        // MARK: - Statues
                        ForEach(city.states) { state in
                            Text(state.title)
                        }
                    }
                }
            }
        }
    }
}

struct CountriesListView_Previews: PreviewProvider {
    static var previews: some View {
        CountriesListView(viewModel: CountryListViewModelCompostionRoot.compose())
    }
}
