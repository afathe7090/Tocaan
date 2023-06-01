//
//  CountryListRequestable.swift
//  Tocaan-Task
//
//  Created by Ahmed Fathy on 01/06/2023.
//

import Infrastructure

struct CountryListRequestable: Requestable {
    var baseUrl: URL { URL(string: "https://app.cheetahkw.com")! }
    var path: String { "/api/areas/countries-with-cities-and-states"}
    var httpMethod: Infrastructure.HTTPMethods = .get
    var task: Infrastructure.Task = .requestPlain
    var headers: Infrastructure.Headers? = nil
}
