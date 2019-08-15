//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
print("Hello, World!")


let myExplicitConstant: Double = 20.0
var myExplicitVariable: Double = 20.0
myExplicitVariable=25
let myImplicitConstant = 20.0
print(type(of: myImplicitConstant))
let myExplicitConstantFloat: Double = 4


//String Conversion
let label = "The width is "
let width = 94
let widthLabel = label + String(width)
print("Hello Kire, the time is \(40.0-10)")


//Quotation
let quotation = """
Today is the start of my Swift mastery! Focus
Kyrhee (Kire) you can do it! Move like a turtle though.

"""

//Arrays and Dictionaries
var shoppingList = ["apple", "pear", "box",]
shoppingList[1] = "pegot"

var occupations = [
    "Kire": "Swfit Developer",
    "Kyrhee":"DevOps, Software Engineering, Data Scientist, Machine Learning Guy"
]

occupations["Milaun"] = "Public Speaker, Hair Care, Body Care, YouTuber"


    //Add Elements - Array
shoppingList.append("Oils")

    //Empty Initialization
let emptyDictionary = [String:Int]()
let emptyArray = [String]()

shoppingList = []
occupations = [:]


//Control Flow
var optionalString:String? = "Hello"
optionalString == nil


var optionalName: String? = nil
var greeting = "Hello"

    //With Optional Values
if let name = optionalName{
    greeting = "Hello, \(name)"
}
else{
    greeting = "Hello, .. is that pronounced Neal? "
}

var optionalDefaultTest: String? = nil
var optionalDefaultTest2: String? = "kire!"


if let name = optionalName ?? optionalDefaultTest ?? optionalDefaultTest2{
    greeting = "Hello \(name)"
}


    //Default Optional Value With ??
let nickName:String? = nil
let fullName: String = "John Appleseed"

let informalGreeting = "Hi, \(nickName ?? fullName)"


    //Switches
let vegetable = "red pepper"

switch vegetable {
    case "celery":
        print("Add some raisins and make ants on a log.")
    case "cucumber", "watercress":
        print("That would make a good tea sandwich.")
    case let x where x.hasSuffix("pepper"):
        print("Is it a spicy \(x)?")
    default:
        print("Everything tastes good in soup.")
}


    //For-in
let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],
]

var largest = 0
var kindOfNumber = ""

for (kind, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
            kindOfNumber = kind
        }
    }
}
print(kindOfNumber,largest)

    //While Loop - Condition can be at the end
var m = 2
repeat{
    m += 1
}while m < 5
print(m)

    //Loop Ranges
var total = 0
for i in 0..<4{
    total += i
}
print(total)

total = 0
for i in 0...4{
    total += i
}
print(total)


// Functions and Closures
func greet(person: String, lunchSpecial:String) -> String{
    return "Hello \(person), today's lunch special is \(lunchSpecial)"
}
greet(person: "Bob", lunchSpecial: "Turkey")

    //Argument Names for parameters
func newGreet(_ person: String,on day:String) -> String{
    return "Hello \(person), today is \(day)"
}

newGreet("Kire", on: "Monday")


    //Return tuples as compound values
func add(_ numberA:Int, to numberB:Int) -> (numA: Int, numB: Int, sum:Int){
    return (numberA,numberB, numberA+numberB)
}

let addFunction = add(2, to: 3)
addFunction.numA
addFunction.0

    //Nested Functions

func returnFifeteen() -> Int{
    var y = 10
    func add(){
        y += 5
    }
    add()
    return y
}

func makeIncrementer() -> ((Int) -> Int){
    func addOne(number: Int) -> Int{
        return 1 + number
    }
    return addOne
}

var increment = makeIncrementer()
increment(7)

    //Functions as parameters
func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}

func lessThanTen(number: Int) -> Bool {
    return number < 10
}


var numbers = [20, 19, 7, 12]
hasAnyMatches(list: numbers, condition: lessThanTen)


    //Closures

numbers.map({ (number: Int) -> Int in
    var result = number
    if number % 2 == 1 {
        result = 0
    }
    return result
})

    //Closures - Omitting parameter and return type when
let mappedNumbers = numbers.map({ number in 3 * number })

    //Parameters accessed by numbers
let sortedNumbers = numbers.sorted { $0 > $1 }


//Objects and Classes
class NamedShape {
    var numberOfSides: Int = 0
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}

    //Overriding Function
class Square: NamedShape {
    var sideLength: Double
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }
    
    func area() -> Double {
        return sideLength * sideLength
    }
    
    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)."
    }
}

    //Running super initialization
class Circle: NamedShape{
    var radius:Float
    var area: Float = 0
    
    init(radius: Float, name: String){
        self.radius = radius
        super.init(name: name)
    }
    
    func area(radius:Int) -> Int{
        return 0
    }
    
    override func simpleDescription() -> String {
        return "A circle with radius of \(radius) and area of \(area)"
    }
    
    
}

    //Variable getter and setter closures
class EquilateralTriangle: NamedShape {
    var sideLength: Double = 0.0
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }
    
    var perimeter: Double {
        get {
            return 3.0 * sideLength
        }
        set {
            sideLength = newValue / 3.0
        }
        
    }
    
    override func simpleDescription() -> String {
        return "An equilateral triangle with sides of length \(sideLength)."
    }
}
var triangle = EquilateralTriangle(sideLength: 3.1, name: "a triangle")
print(triangle.perimeter)
triangle.perimeter = 9.9
print(triangle.perimeter)


class Shape {
    var numberOfSides = 0
    var name: String
    let nameOfShape = "Square"
    
    init(name: String){
        self.name = name
    }
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
    
    func addASide(currentSides:Int){
        numberOfSides += 1
    }
}

    //Modifying variable values after their initialization in init
    //willSet after change & didSet before change
class TriangleAndSquare {
    var triangle: EquilateralTriangle {
        willSet {
            square.sideLength = newValue.sideLength
        }
    }
    var square: Square {
        willSet {
            triangle.sideLength = newValue.sideLength
        }
        }
    init(size: Double, name: String) {
        square = Square(sideLength: size, name: name)
        triangle = EquilateralTriangle(sideLength: size, name: name)
    }
}


    //Functions that are Optional
let optionalSquare: Square? = Square(sideLength: 2.5, name: "optional square")
let sideLength = optionalSquare?.sideLength


//Enumeration and Structures

enum Rank: Int {
    //By default cases start at 0. Was altered here by ace = 1
    case ace = 1
    case two, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king
    
    func simpleDescription() -> String {
        switch self {
            case .ace:
                return "ace"
        case .jack:
            return "jack"
        case .queen:
            return "queen"
        case .king:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
    
    func compareRank(_ of: Rank, to: Rank) -> Bool{
        return of.rawValue == to.rawValue
    }
}

let ace = Rank.ace
let aceRawValue = ace.rawValue


enum Suit:Int {
    case spades = 1
    case hearts, diamonds, clubs
    
    func simpleDescription() -> String {
        switch self {
        case .spades:
            return "spades"
        case .hearts:
            return "hearts"
        case .diamonds:
            return "diamonds"
        case .clubs:
            return "clubs"
        }
    }
    
    //Switch case need to know the type
    func color(_ suit:Suit) -> String{
        switch suit.simpleDescription() {
        case "spades", "clubs":
            return "black"
            
        case "hearts":
            return "red"
            
        default:
            return "Not a card"
        }
    }
}

var clubs:Suit = Suit.clubs
clubs.color(clubs)



enum ServerResponse {
    case result(String, String)
    case failure(String)
    case requestError(String)
}

let success = ServerResponse.result("6:00 am", "8:09 pm")
let failure = ServerResponse.failure("Out of cheese.")
let requestError = ServerResponse.requestError("404")

switch success {
case let .result(sunrise, sunset):
    print("Sunrise is at \(sunrise) and sunset is at \(sunset).")
case let .failure(message):
    print("Failure...  \(message)")
case let .requestError(errorCode):
    print("Request error \(errorCode)")
}


//Structures are always copied not referenced. Use wisely you know because of space
struct Card {
    var rank: Rank
    var suit: Suit
    
    
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
    
}
let threeOfSpades = Card(rank: .three, suit: .spades)
let threeOfSpadesDescription = threeOfSpades.simpleDescription()

var rank = Rank(rawValue: 13)
var suit = Suit(rawValue: 4)

func deckOfCards() -> [Card] {
    var deck =  [Card]()
    var currentSuitValue = 1
    while currentSuitValue <= 4{
        let currentSuit = Suit(rawValue: currentSuitValue)
        for rank in 1..<14{
            let currentRank = Rank(rawValue: rank)
            let card = Card(rank: currentRank!, suit: currentSuit!)
            deck.append(card)
        }
        currentSuitValue += 1
    }
    return deck
}
deckOfCards()


//Protocols and Extensions

protocol ExampleProtocol{
    var simpleDescription:String { get }
    var protocolName: String {get set}
    mutating func adjust()
}

class SimpleClass: ExampleProtocol{
    var simpleDescription: String = "A very simple class."
    var anotherProperty: Int = 69105
    var protocolName: String{
        get {
            return "Call simpleDescription. You can not return a function that has no return value"
        }
        
        set{
            simpleDescription += newValue
        }
    }
    func adjust() {
        simpleDescription += "  Now 100% adjusted."
    }
}

var a = SimpleClass()
a.adjust()
let aDescription = a.simpleDescription

struct SimpleStructure: ExampleProtocol {
    var simpleDescription: String = "A simple structure"
    var protocolName: String{
        get {
            return simpleDescription
        }
        
        set{
            simpleDescription = newValue
        }
    }
    mutating func adjust() {
        simpleDescription += " (adjusted)"
    }
}
var b = SimpleStructure()
b.adjust()
let bDescription = b.simpleDescription

//Extensions
//Can not store properties

//extension Int: ExampleProtocol {
//    var simpleDescription: String {
//        return "An extension of Example Protocol with name "
//    }
//    mutating func adjust() {
//        self += 42
//    }
//    var protocolName: String{
//        get {
//             return "Call simpleDescription"
//        }
//
//        set{
//             "Use Structure instead. simpleDescription here is get only no set behavior"
//        }
//    }
//}
//
//
//extension Double: ExampleProtocol {
//    var simpleDescription: String {
//        return "The number \(self)"
//    }
//    mutating func adjust() {
//        self += 42.4
//    }
//    var protocolName: String{
//        get {
//            return "Call simpleDescription"
//        }
//
//        set{
//            "Use Structure instead. simpleDescription here is get only no set behavior"
//        }
//    }
//}


let protocolValue: ExampleProtocol = a
print(protocolValue.simpleDescription)
//print(protocolValue.anotherProperty)


//Error Handling
enum PrinterError: Error{
    case outOfPaper
    case noToner
    case onFire
}


func send(job: Int, toPrinter printerName: String) throws -> String {
    if printerName == "Never Has Toner" {
        throw PrinterError.noToner
    }
    else if printerName == "Never Has Paper"{
        throw PrinterError.outOfPaper
    }
    else if printerName == "Never Not On Fire"{
        throw PrinterError.onFire
    }
    return "Job sent"
}
    //Do-Catch
//send() function can throw error so preceed call with try

do {
    //Uncomment to throw error
    //let printerResponse = try send(job: 1040, toPrinter: "Never Has Toner")
    let printerResponse = try send(job: 1040, toPrinter: "Bi Sheng")
    print(printerResponse)
} catch {
    print(error)
}


// Catch can match cases just like a switch case!
do {
    //let printerResponse = try send(job: 1440, toPrinter: "Gutenberg")
    
    //Fire Error
    let printerResponse = try send(job: 1440, toPrinter: "Never Not Of Fire")
    
    
    //Printer Error caught after Fire Catch case.
    //let printerResponse = try send(job: 1440, toPrinter: "Never Has Toner")
    
    
    //I think it is impossible to catch the last case given the base return statement in the send function.
    print(printerResponse)
} catch PrinterError.onFire {
    print("I'll just put this over here, with the rest of the fire.")
} catch let printerError as PrinterError {
    print("Printer error: \(printerError).")
} catch {
    print(error)
}


    //try? Optional. Nil for error and value if no error
//Returns Job Sent
let printerSuccess = try? send(job: 1884, toPrinter: "Mergenthaler")
//Returns nil
let printerFailure = try? send(job: 1885, toPrinter: "Never Has Toner")


    //Defer keyword. Block of code deffered until right before the function returns
var fridgeIsOpen = false
let fridgeContent = ["milk", "eggs", "leftovers"]

func fridgeContains(_ food: String) -> Bool {
    fridgeIsOpen = true
    defer {
        fridgeIsOpen = false
    }
    
    let result = fridgeContent.contains(food)
    return result
}
fridgeContains("banana")
print(fridgeIsOpen)


    //Generics with <T>
func makeArray<Item>(repeating item: Item, numberOfTimes: Int) -> [Item] {
    var result = [Item]()
    for _ in 0..<numberOfTimes {
        result.append(item)
    }
    return result
}
makeArray(repeating: "knock", numberOfTimes: 4)


// Reimplement the Swift standard library's optional type
enum OptionalValue<Wrapped> {
    case none
    case some(Wrapped)
}
var possibleInteger: OptionalValue<Int> = .none
possibleInteger = .some(100)

    //Where to enfore requirements in a function
// Writing <T: Equatable> is the same as writing <T> ... where T: Equatable.
func anyCommonElements<T: Sequence, U: Sequence>(_ lhs: T, _ rhs: U) ->
    [T.Element]
    where T.Element: Equatable, T.Element == U.Element
{
    var commonElements = [T.Element]()
    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem {
               commonElements.append(rhsItem)
            }
        }
    }
    return commonElements
}
anyCommonElements([1, 2, 3], [3,2])




