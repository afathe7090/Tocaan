//
//  HTTPRequestable.swift
//  Tocaan-Task
//
//  Created by Ahmed Fathy on 01/06/2023.
//


import Foundation

public typealias Headers = [String: String]

public protocol Requestable {
    var baseUrl: URL { get }
    var path: String { get }
    var httpMethod: HTTPMethods { get }
    var task: Task { get }
    var headers: Headers? { get }
}
