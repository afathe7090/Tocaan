//
//  DataDecoderExtension.swift
//  Tocaan-Task
//
//  Created by Ahmed Fathy on 01/06/2023.
//


import Foundation

public extension Data {
    func decode<T: Decodable>(to type: T.Type) throws -> T  {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: self)
    }
}
