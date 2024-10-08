//: [Previous](@previous)

import Foundation
import Combine

// Publisher & Subscriber
let just = Just(1000)
let subscription = just.sink { value in
    print("Recived Value \(value)")
}

let arrayPublisher = [1, 3, 5, 7, 9].publisher
let subscription2 = arrayPublisher.sink { value in
    print("Recived Value \(value)")
}

class MyClass {
    var property: Int = 0 {
        didSet {
            print("Did set property to \(property)")
        }
    }
}

let object = MyClass()
let subscription3 = arrayPublisher.assign(to: \.property, on: object)
print("Final Vlaue \(object.property)")








//: [Next](@next)


