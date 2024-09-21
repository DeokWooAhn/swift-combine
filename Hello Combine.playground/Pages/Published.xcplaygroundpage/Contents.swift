//: [Previous](@previous)

import Foundation
import UIKit
import Combine

final class SomeViewModel {
    @Published var name = "Jack"
    var age = 20
}

final class Label {
    var text = ""
}

let label = Label()
let vm = SomeViewModel()
print("text: \(label.text)")

vm.$name.assign(to: \.text, on: label)
print("text: \(label.text)")

vm.name = "Tom"



//: [Next](@next)
