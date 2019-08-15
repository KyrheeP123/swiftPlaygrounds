import UIKit
//Protocol with single instance property requirement
protocol FullyNamed {
    var fullName: String { get }
}

struct Person: FullyNamed {
    var fullName: String
}
let john = Person(fullName: "John Appleseed")


//Method Requirements
//Type Method Prefixed by static

protocol SomeProtocol {
    static func someTypeMethod()
}


//Protocol Extensions
//RandomNumberGenerator now has this functionality already included. Any thing that conforms to this protocol will have the functionality built-in
extension RandomNumberGenerator {
    func randomBool() -> Bool {
        return random() > 0.5
    }
}


let generator2 = LinearCongruentialGenerator()
print("Here's a random number: \(generator2.random())")
print("And here's a random Boolean: \(generator2.randomBool())")


protocol RandomNumberGenerator {
    func random() -> Double
}

//Class conforms to RandomNumberGenerator
class LinearCongruentialGenerator: RandomNumberGenerator {
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    func random() -> Double {
        lastRandom = ((lastRandom * a + c).truncatingRemainder(dividingBy:m))
        return lastRandom / m
    }
}
let generator = LinearCongruentialGenerator()
print("Here's a random number: \(generator.random())")
print("And another one: \(generator.random())")


//Protocols Used as Type
class Dice {
    let sides: Int
    let generator: RandomNumberGenerator
    init(sides: Int, generator: RandomNumberGenerator) {
        self.sides = sides
        self.generator = generator
    }
    func roll() -> Int {
        return Int(generator.random() * Double(sides)) + 1
    }
}

var d6 = Dice(sides: 6, generator: LinearCongruentialGenerator())
for _ in 1...5 {
    print("Random dice roll is \(d6.roll())")
}


//Mutating Method Requirements
protocol Togglable {
    mutating func toggle()
}

enum OnOffSwitch: Togglable {
    case off, on
    //In enums, and structures you have to prefix mutating methods with mutating expect when conforming the protocol in a class
    mutating func toggle() {
        switch self {
            case .off:
                self = .on
            case .on:
                self = .off
        }
    }
}
var lightSwitch = OnOffSwitch.off
lightSwitch.toggle()


//Delegation

protocol DiceGame {
    var dice: Dice { get }
    func play()
}

//Class only protocol due to AnyObject inheritance
protocol DiceGameDelegate: AnyObject {
    func gameDidStart(_ game: DiceGame)
    func game(_ game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int)
    func gameDidEnd(_ game: DiceGame)
}


class SnakesAndLadders: DiceGame {
    let finalSquare = 25
    let dice = Dice(sides: 6, generator: LinearCongruentialGenerator())
    var square = 0
    var board: [Int]
    init() {
        board = Array(repeating: 0, count: finalSquare + 1)
        board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
        board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
    }
    weak var delegate: DiceGameDelegate?
    func play() {
        square = 0
        delegate?.gameDidStart(self)
        gameLoop: while square != finalSquare {
            let diceRoll = dice.roll()
            delegate?.game(self, didStartNewTurnWithDiceRoll: diceRoll)
            switch square + diceRoll {
                case finalSquare:
                    break gameLoop
                case let newSquare where newSquare > finalSquare:
                    continue gameLoop
                default:
                    square += diceRoll
                    square += board[square]
            }
        }
        delegate?.gameDidEnd(self)
    }
}

class DiceGameTracker: DiceGameDelegate {
    var numberOfTurns = 0
    func gameDidStart(_ game: DiceGame) {
        numberOfTurns = 0
        if game is SnakesAndLadders {
            print("Started a new game of Snakes and Ladders")
        }
        print("The game is using a \(game.dice.sides)-sided dice")
    }
    func game(_ game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int) {
        numberOfTurns += 1
        print("Rolled a \(diceRoll)")
    }
    func gameDidEnd(_ game: DiceGame) {
        print("The game lasted for \(numberOfTurns) turns")
    }
}


let tracker = DiceGameTracker()
let game = SnakesAndLadders()
game.delegate = tracker
game.play()


//Extend existing type to conform to protocol without having access to source code
//This protocol can be conformed by the String type which we don't have access to
protocol TextRepresentable {
    var textualDescription: String { get }
}


//Extending Dice to conform to TextRepresentable protocol
extension Dice: TextRepresentable {
    var textualDescription: String {
        return "A \(sides)-sided dice"
    }
}


let d12 = Dice(sides: 12, generator: LinearCongruentialGenerator())
//Extended protocol variable
print(d12.textualDescription)


//Extending SnakesAndLadders to TextRepresentable protocol
extension SnakesAndLadders: TextRepresentable {
    var textualDescription: String {
        return "A game of Snakes and Ladders with \(finalSquare) squares"
    }
}
print(game.textualDescription)

//Conditionally conforming to a protocol
//Forcing any array that contains elements of TextRepresentable to provide a textualDescription
extension Array: TextRepresentable where Element: TextRepresentable {
    var textualDescription: String {
        let itemsAsText = self.map { $0.textualDescription }
        return "[" + itemsAsText.joined(separator: ", ") + "]"
    }
}
let myDice = [d6, d12]
print(myDice.textualDescription)


//Declaring protocol adoption with Extension
//When a type already conforms to a protocol then you can make it adopt that protocol with a black extension
struct Hamster {
    var name: String
    //Necessary variable for TextRepresentable protocol
    var textualDescription: String {
        return "A hamster named \(name)"
    }
}
extension Hamster: TextRepresentable {}

//Instances of Hamster can now be used wherever TextRepresentable is the required type
let simonTheHamster = Hamster(name: "Simon")
let somethingTextRepresentable: TextRepresentable = simonTheHamster
print(somethingTextRepresentable.textualDescription)


//Collection of Protocol types
let things: [TextRepresentable] = [game, d12, simonTheHamster]

for thing in things {
    print(thing.textualDescription)
}


//Protocol Inheritance
//Inherits textualDescription from textRepresentable protocol and adds prettyTextualDescription as a requirement for it's protocol
protocol PrettyTextRepresentable: TextRepresentable {
    var prettyTextualDescription: String { get }
}


//SnakesAndLadders extends to adopt PrettyTextRepresentable. It already adops TextRepresentable.
extension SnakesAndLadders: PrettyTextRepresentable {
    var prettyTextualDescription: String {
        //Still has to provide textualDescription instance from TextRepresentable protocol.
        var output = textualDescription + ":\n"
        for index in 1...finalSquare {
            switch board[index] {
                case let ladder where ladder > 0:
                    output += "▲ "
                case let snake where snake < 0:
                    output += "▼ "
                default:
                    output += "○ "
            }
        }
        return output
    }
}
print(game.prettyTextualDescription)

//Protocol Composition
//Combining two or more protocols to be required for a particular type
protocol Named {
    var name: String { get }
}
protocol Aged {
    var age: Int { get }
}

struct Person2: Named, Aged {
    var name: String
    var age: Int
}

func wishHappyBirthday(to celebrator: Named & Aged) {
    print("Happy birthday, \(celebrator.name), you're \(celebrator.age)!")
}

let birthdayPerson = Person2(name: "Malcolm", age: 21)
wishHappyBirthday(to: birthdayPerson)


class Location {
    var latitude: Double
    var longitude: Double
    init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
}

//Adopts Named and Location protocol
class City: Location, Named {
    //Named protocol dependency
    var name: String
    init(name: String, latitude: Double, longitude: Double) {
        //Storing name for Named protocol
        self.name = name
        //Executing super class initializer to satisfy inheritance of Location class with latitude and longitude
        super.init(latitude: latitude, longitude: longitude)
    }
}
//Protocol Composition for Location Class and Named protocol
func beginConcert(in location: Location & Named) {
    print("Hello, \(location.name)!")
}


//City is Subclass to Location and adopts Named protocol so beginConcert checks out on dependencies
let seattle = City(name: "Seattle", latitude: 47.6, longitude: -122.3)
beginConcert(in: seattle)


//Checking for Protocol Conformance
if let doesConformToLocationAndNamed = seattle as? Named & Location{
    print("Seattle is a subclass of Location and adopts the Named protocol!")
}


protocol HasArea {
    var area: Double { get }
}

class Circle: HasArea {
    let pi = 3.1415927
    var radius: Double
    var area: Double { return pi * radius * radius }
    init(radius: Double) { self.radius = radius }
}

class Country: HasArea {
    var area: Double
    init(area: Double) { self.area = area }
}

class Animal {
    var legs: Int
    init(legs: Int) { self.legs = legs }
}


let objects: [AnyObject] = [
    Circle(radius: 2.0),
    Country(area: 243_610),
    Animal(legs: 4)
]


for object in objects {
    if let objectWithArea = object as? HasArea {
        print("Area is \(objectWithArea.area)")
    } else {
        print("Something that doesn't have an area")
    }
}


//Optional Protocol Requirements

//Optional Protocol Requirements are used to write code that interoperates with Objective-C
@objc protocol CounterDataSource {
    @objc optional func increment(forCount count: Int) -> Int
    @objc optional var fixedIncrement: Int { get }
}


//Optional Protocols Requirements do not have to be stated after the class name
class Counter {
    var count = 0
    //Optional CounterDataSource protocol type
    var dataSource: CounterDataSource?
    
    func increment() {
        //If data source exist and increment is implemented
        if let amount = dataSource?.increment?(forCount: count) {
            count += amount
            //if data source stores a fixedIncrement
        } else if let amount = dataSource?.fixedIncrement {
            count += amount
        }
    }
}


class ThreeSource: NSObject, CounterDataSource {
    let fixedIncrement = 3
}


var counter = Counter()
//ThreeSource conforms to CounterDataSource protocol which is a type embedded in type ThreeSource
counter.dataSource = ThreeSource()
for _ in 1...4 {
    counter.increment()
    print(counter.count)
}


//
class TowardsZeroSource: NSObject, CounterDataSource {
    func increment(forCount count: Int) -> Int {
        
        //When counter reached 0 stop
        if count == 0 {
            return 0
        } else if count < 0 {
            return 1
        } else {
            return -1
        }
    }
}


counter.count = -4
//Change counter's dataSource on the fly
counter.dataSource = TowardsZeroSource()
for _ in 1...5 {
    counter.increment()
    print(counter.count)
}


//Providing Default Implementations
extension PrettyTextRepresentable  {
    var prettyTextualDescription: String {
        return textualDescription
    }
}


//Adding Contraints to Protocol Extensions
//In order to use the default implementation of the allEqual function the Collection must have Elements which are Equatalbe i.e can use == !=
extension Collection where Element: Equatable {
    func allEqual() -> Bool {
        for element in self {
            if element != self.first {
                return false
            }
        }
        return true
    }
}

let equalNumbers = [100, 100, 100, 100, 100]
let differentNumbers = [100, 100, 200, 100, 200]

print(equalNumbers.allEqual())
print(differentNumbers.allEqual())







protocol SomeProtocol {
    init(someParameter: Int)
}

//Classes that conform to protocol initializer requirements must be prefixed with required. This was subclasses of this class adhere to the protocol as well
class SomeClass: SomeProtocol {
    required init(someParameter: Int) {
        // initializer implementation goes here
    }
}


protocol SomeProtocol {
    init()
}

class SomeSuperClass {
    init() {
        // initializer implementation goes here
    }
}

//Override and required keyword for initializer
class SomeSubClass: SomeSuperClass, SomeProtocol {
    // "required" from SomeProtocol conformance; "override" from SomeSuperClass
    required override init() {
        // initializer implementation goes here
    }
}


//Faliable Initializer Requirements


//Syntax
protocol SomeProtocol {
    // protocol definition goes here
}


struct SomeStructure: FirstProtocol, AnotherProtocol {
    // structure definition goes here
}


class SomeClass: SomeSuperclass, FirstProtocol, AnotherProtocol {
    // class definition goes here
}

//Property Requirements
protocol SomeProtocol {
    //Any conforming type must provide a variable with this name, and getter and setter methods to adhere to this rule
    var mustBeSettable: Int { get set }
    //Any conforming type must provide a variable or constant with this name, type, and getter method or getter and setter methods to adhere to this ule
    var doesNotNeedToBeSettable: Int { get }
}

//Type property requirements must begin with static
protocol AnotherProtocol {
    //Any conforming type must provide a variable with this name, type, and getter and setter methods to adhere to this rule
    static var someTypeProperty: Int { get set }
}


//Inheriting a protocol syntax
protocol InheritingProtocol: SomeProtocol, AnotherProtocol {
    // protocol definition goes here
}


//Class Types Only Protocols
protocol SomeClassOnlyProtocol: AnyObject, SomeInheritedProtocol {
    // class-only protocol definition goes here
}


