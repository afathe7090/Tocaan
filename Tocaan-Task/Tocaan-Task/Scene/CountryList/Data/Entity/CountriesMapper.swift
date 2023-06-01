//
//  CountriesMapper.swift
//  Tocaan-Task
//
//  Created by Ahmed Fathy on 01/06/2023.
//

import Infrastructure

struct CountriesMapper {
    struct InvalidToMapDataModel: Error {}
    static func map(data: Data, response: HTTPURLResponse) throws -> Response {
        guard let response = try? data.decode(to: Response.self) else {
            throw InvalidToMapDataModel()
        }
        return response
    }
}
