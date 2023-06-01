//
//  Countries.swift
//  Tocaan-Task
//
//  Created by Ahmed Fathy on 01/06/2023.
//

import Foundation

struct Response: Codable {
    var success: Bool
    var data: [Country]
    var message: String
    enum CodingKeys: String, CodingKey {
        case success, data, message
    }
}

struct Country: Codable, Identifiable {
    var id: Int
    var title: String
    var status: Int
    var cities: [City]
    
    var isExpandable: Bool? = false
    func count() -> Int { isExpandable == true ? (cities.count + 1):1 }
    mutating func toggle() {
        isExpandable = !(isExpandable ?? false)
    }
}

struct City: Codable, Identifiable{
    var id: Int
    var title: String
    var status: Int
    var states: [State]
    var isExpandable: Bool? = false
    func count() -> Int { isExpandable == true ? (states.count + 1):1 }
    mutating func toggle() {
        isExpandable = !(isExpandable ?? false)
    }
}

struct State: Codable, Identifiable {
    var id: Int
    var title: String
    var status: Int
}

