//
//  EncodableExtension.swift
//  Tocaan-Task
//
//  Created by Ahmed Fathy on 01/06/2023.
//


import Foundation

public extension Encodable {
     func prepareBody() -> Data? {
        let encoder = JSONEncoder()
        return try? encoder.encode(self)
    }
}
