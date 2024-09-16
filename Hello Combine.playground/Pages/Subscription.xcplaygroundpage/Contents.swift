//: [Previous](@previous)

import Foundation
import Combine

let subject = PassthroughSubject<String, Never>()

// The print() operator prints you all lifecycle events
let subcription = subject
    .print("[Debug]")
    .sink { value in
    print("Subcriber received value \(value)")
}

subject.send("Hello")
subject.send("Hello again!")
subject.send("Hello for the last tiem")
//subject.send(completion: .finished)
subcription.cancel()
subject.send("Hello ?? :(")

//: [Next](@next)
