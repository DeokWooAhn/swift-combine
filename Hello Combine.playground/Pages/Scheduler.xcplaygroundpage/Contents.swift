//: [Previous](@previous)

import Foundation
import Combine

let arrPublisher = [1, 2, 3].publisher

let queue = DispatchQueue(label: "custom")

let subscription = arrPublisher
    .map { value -> Int in
        print("transform: \(value), thread: \(Thread.current)")
        return value
    }
    .sink { value in
    print("Receive Value: \(value), thread: \(Thread.current)")
}



//: [Next](@next)
