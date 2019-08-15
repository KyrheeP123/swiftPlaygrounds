//: [Previous](@previous)

import Foundation

//Strong Reference Cycles Between Class Instances
// Create a strong reference when either Person2 or Apartment instance is created.
class Person {
    let name: String
    init(name: String) { self.name = name }
    var apartment: Apartment?
    deinit { print("\(name) is being deinitialized") }
}

class Apartment {
    let unit: String
    init(unit: String) { self.unit = unit }
    var tenant: Person?
    deinit { print("Apartment \(unit) is being deinitialized") }
}


//Optional objects, no references, no memory allocated
var john: Person?
var unit4A: Apartment?


john = Person(name: "John Appleseed")
unit4A = Apartment(unit: "4A")


//Creating Strong reference cycle
john!.apartment = unit4A
unit4A!.tenant = john


//reference to instance set to nil, but the instances both have a strong reference to each other therefore, their deinitializers are not called
john = nil
unit4A = nil


//: [Next](@next)
