//
//  PublisherMainQueueSchaduler.swift
//  Tocaan-Task
//
//  Created by Ahmed Fathy on 01/06/2023.
//


import Combine
import Foundation

public extension Publisher {
    func dispatchOnMainQueue() -> AnyPublisher<Output, Failure> {
        receive(on: DispatchQueue.immediateWhenOnMainQuesueScheduler).eraseToAnyPublisher()
    }
}
