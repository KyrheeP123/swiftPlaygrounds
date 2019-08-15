//: [Previous](@previous)

import Foundation

// Resolving Strong Reference Cycles Between Class Instances
class Person {
    let name: String
    init(name: String) { self.name = name }
    var apartment: Apartment?
    deinit { print("\(name) is being deinitialized") }
}

class Apartment {
    let unit: String
    init(unit: String) { self.unit = unit }
    
    //Weak variable optional reference to Person
    weak var tenant: Person?
    deinit { print("Apartment \(unit) is being deinitialized") }
}


var john: Person?
var unit4A: Apartment?

john = Person(name: "John Appleseed")
unit4A = Apartment(unit: "4A")

john!.apartment = unit4A
unit4A!.tenant = john

//Breaking strong reference to Person instance and Apartment instace
john = nil
unit4A = nil


//Unowned Reference
class Customer {
    let name: String
    var card: CreditCard?
    init(name: String) {
        self.name = name
    }
    deinit { print("\(name) is being deinitialized") }
}

class CreditCard {
    let number: UInt64
    //Unowned Customer is never nil, it's unowned because a Customer outlives a credit card, how we avoid a strong reference cycle
    unowned let customer: Customer
    init(number: UInt64, customer: Customer) {
        self.number = number
        self.customer = customer
    }
    deinit { print("Card #\(number) is being deinitialized") }
}


var tom: Customer?
tom = Customer(name: "John Appleseed")
tom!.card = CreditCard(number: 1234_5678_9012_3456, customer: tom!)
tom = nil

//Unowned References and Implicity Unwrapped Optional Properties
class Country {
    let name: String
    //Implicitly unwrapped, default value will be nil, initialization of Country is therfore complete after providing a name for itself
    var capitalCity: City!
    init(name: String, capitalName: String) {
        self.name = name
        self.capitalCity = City(name: capitalName, country: self)
    }
}

class City {
    let name: String
    unowned let country: Country
    init(name: String, country: Country) {
        self.name = name
        self.country = country
    }
}


var country = Country(name: "Canada", capitalName: "Ottawa")
print("\(country.name)'s capital city is called \(country.capitalCity.name)")



//Strong Reference cycles for Closures
class HTMLElement {
    
    let name: String
    //optional text value, default value is nil
    let text: String?
    
    //Lazy, not initialized until it is used to save space, because it's a computed closure and not an instance method it can be replaced
    lazy var asHTML: () -> String = {
        //clousure list to have unowned reference to self to stop a strong reference cycly from taking place
        [unowned self] in
        //if HTMLElement has set text property
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name) />"
        }
    }
    
    //If text not provided set the text field to nil
    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }
    
    //When no strong references left, print the name of this HTMLElement is being deinitialized
    deinit {
        print("\(name) is being deinitialized")
    }
}


let heading = HTMLElement(name: "h1")
let defaultText = "some default text"
heading.asHTML = {
    //If heading.text is nil then go with the defaultText
    return "<\(heading.name)>\(heading.text ?? defaultText)</\(heading.name)>"
}
print(heading.asHTML())

//Only defined as optional to change to nil, and show the potential for strong reference cycle
var paragraph: HTMLElement? = HTMLElement(name: "p", text: "hello, world")
print(paragraph!.asHTML())

//Reference to HTMLElement instance is broken but, not the HTMLElement instace strong reference to the asHTML closure
paragraph = nil


//Closure List Syntax
lazy var someClosure: (Int, String) -> String = {
    [unowned self, weak delegate = self.delegate!] (index: Int, stringToProcess: String) -> String in
    // closure body goes here
}


lazy var someClosure: () -> String = {
    [unowned self, weak delegate = self.delegate!] in
    // closure body goes here
}


//Understanding Conflicting Access to Memory
// A write access to the memory where one is stored.
var one = 1


// A read access from the memory where one is stored.
print("We're number \(one)!")


//Characteristics of Memory Access
//Instantenous Memory Access
func oneMore(than number: Int) -> Int {
    return number + 1
}

var myNumber = 1
myNumber = oneMore(than: myNumber)
print(myNumber)


// Conflicting Access to In-Out Parameters”
var stepSize = 1

//long term access to number inout parameter
func increment(_ number: inout Int) {
    //read access to stepSize
    number += stepSize
}


// Error: conflicting accesses to stepSize
//write access to stepSize
increment(&stepSize)


// Make an explicit copy to solve memory access
var copyOfStepSize = stepSize
increment(&copyOfStepSize)

// Update the original.
stepSize = copyOfStepSize

//Requesting write access to both requirements at the same time
func balance(_ x: inout Int, _ y: inout Int) {
    let sum = x + y
    x = sum / 2
    y = sum - x
}
var playerOneScore = 42
var playerTwoScore = 30
balance(&playerOneScore, &playerTwoScore)  // OK
balance(&playerOneScore, &playerOneScore)
// Error: conflicting accesses to playerOneScore


//Conflicting access to self in Methods
struct Player {
    var name: String
    var health: Int
    var energy: Int
    
    static let maxHealth = 10
    //mutate self during the duration of the function
    mutating func restoreHealth() {
        health = Player.maxHealth
    }
    
    
}


extension Player {
    //Memory conflict when referencing to teammate.health and health of the SAME Player object
    mutating func shareHealth(with teammate: inout Player) {
        balance(&teammate.health, &health)
    }
}

var oscar = Player(name: "Oscar", health: 10, energy: 10)
var maria = Player(name: "Maria", health: 5, energy: 10)
oscar.shareHealth(with: &maria)  // OK


oscar.shareHealth(with: &oscar)
// Error: conflicting accesses to oscar”


//Conflicting access to properties
var playerInformation = (health: 10, energy: 20)
balance(&playerInformation.health, &playerInformation.energy)
// Error: conflicting access to properties of playerInformation

var holly = Player(name: "Holly", health: 10, energy: 10)
balance(&holly.health, &holly.energy)  // Error


func someFunction() {
    var oscar = Player(name: "Oscar", health: 10, energy: 10)
    balance(&oscar.health, &oscar.energy)  // OK
}



//: [Next](@next)
