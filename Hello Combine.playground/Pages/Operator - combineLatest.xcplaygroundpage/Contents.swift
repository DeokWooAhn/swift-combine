//: [Previous](@previous)

import Foundation
import Combine


// Basic CombineLatest
let strPublisher = PassthroughSubject<String, Never>()
let numPublisher = PassthroughSubject<Int, Never>()

//strPublisher.combineLatest(numPublisher).sink { (str, num) in
//    print("Receive: \(str), \(num)")
//}

Publishers.CombineLatest(strPublisher, numPublisher).sink { (str, num) in
        print("Receive: \(str), \(num)")
}

//strPublisher.send("a")
//strPublisher.send("b")
//strPublisher.send("c")
//
//numPublisher.send(1)
//numPublisher.send(2)
//numPublisher.send(3)

strPublisher.send("a")
numPublisher.send(1)
strPublisher.send("b")
strPublisher.send("c")

numPublisher.send(2)
numPublisher.send(3)

// Advanced CombineLatest
let userNamePublisher = PassthroughSubject<String, Never>()
let passwordPublisher = PassthroughSubject<String, Never>()

let validtedCrendetialsSubscription = userNamePublisher.combineLatest(passwordPublisher)
    .map { (userName, password) -> Bool in
        return !userName.isEmpty && !password.isEmpty && password.count > 12
    }
    .sink { valid in
        print("Credential  valid?: \(valid)")
    }

userNamePublisher.send("Ahn")
passwordPublisher.send("weakPw")
passwordPublisher.send("veryStrongPassword")

// Merge
let publisher1 = [1, 2, 3, 4, 5].publisher
let publisher2 = [300, 400, 500].publisher

//let mergePublisherSubscription = publisher1.merge(with: publisher2)
//    .sink { value in
//            print("Merge: subscription recevied value: \(value)")
//    }

let mergePublisherSubscription = Publishers.Merge(publisher1, publisher2)
    .sink { value in
        print("Merge: subscription recevied value: \(value)")
    }

//: [Next](@next)
