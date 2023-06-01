//
//  QueryItemsParamaterMapper.swift
//  Tocaan-Task
//
//  Created by Ahmed Fathy on 01/06/2023.
//


import Foundation

public struct QueryItemsParamaterMapper {
    public static func map(key: String, value: Any) -> URLQueryItem {
        URLQueryItem(name: key, value: String(describing: value))
    }
}
