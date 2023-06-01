//
//  HTTPClientTask.swift
//  Tocaan-Task
//
//  Created by Ahmed Fathy on 01/06/2023.
//

import Foundation

public typealias Parameters = [String: Any]

public enum Task {
    case requestPlain
    case requestParameters(Parameters)
    case requestBody(Encodable)
}
