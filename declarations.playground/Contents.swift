import UIKit

//In-Out Parameters
//Mutating an In-Out Parameter
func multithreadedFunction(queue: DispatchQueue, x: inout Int) {
    // Make a local copy and manually copy it back.
    var localX = x
    defer { x = localX }
    
    // Operate on localX asynchronously, then wait before returning.
    //queue.async { someMutatingOperation(&localX) }
    queue.sync {}
}


//Default Parameter
//Wow I love Swift
func f(x: Int = 42) -> Int { return x }


//Enumerations with case of Any type

enum Number{
    case integer(Int)
    case real(Float)
}


//Implicit function for the enumeration Number (Integer) -> Number
let f = Number.integer

//Convert each number to a Number Integer type
let numbers:[Number] = [2,4,6,8].map(f)

//Enumeration Indirection
enum Tree<T>{
    case empty
    //Associated type that consists of a type of the enumeration
    indirect case node(value: T, left: Tree, right: Tree)
}


//Enumerations with cases of Raw-Value Types
enum ExampleEnum:Int{
    //a = 0, b=1, c=5, d=6 d is 6 because it increments from the previous case of c
    case a,b,c=5,d
}

enum GamePlayMode: String{
    //For strings the default raw value is the name of the case
    case cooperative, individual, competitive
}

//Protocol Declaration

//Protocol definition specifically for class objects with one optional protocol member


//Protocols only for objects, because this is an option member type
//@objc protocol addProtocol {
//    @objc optional var addMe:[Int]?{get set}
//}
//
//
//
//class addOperator: addProtocol{
//
//    var leftAddOperator: Int?
//    var rightAddOperator: Int?
//
//
//    //Initializer with default values
//    init(leftAddOperator: Int = 5, rightAddOperator: Int = 2){
//        self.rightAddOperator = rightAddOperator
//        self.leftAddOperator = leftAddOperator
//    }
//
//
//    var addMe: [Int]?{
//        get{
//            //Get the result of add
//            if let leftOperator = self.leftAddOperator! ?? 0{
//                
//            }
//            if let rightOperator = self.rightAddOperator? ?? 0{
//                continue
//            }
//
//
//            let result: Int = leftAddOperator + rightAddOperator
//            return Array<Int>(repeating: result, count: 1)
//        }
//
//         set{
//
//            //Ensures we only take the first two value
//            self.leftAddOperator = newValue[0]? ?? 0
//            self.rightAddOperator = newValue[1] ?? 0
//        }
//    }
//
//}
//
//
//var myAdder = addOperator()
//print(myAdder.addMe?)
//myAdder.addMe = [0,1,100]
//print(myAdder.addMe?)


////Protocol Associated Type Declaration
//protocol SomeProtocol{
//    associatedtype SomeType
//}

//protocol SubProtocolA: SomeProtocol{
//    //This syntax produces a warning.
//    associatedtype SomeType: Equatable
//}
//
////Equivalent to the above and preferred
//protocol SubProtocolB: SomeProtocol where SomeType: Equatable{
//
//}


//Failable Initializer
struct SomeStruct {
    let property: String
    // produces an optional instance of 'SomeStruct'
    init?(input: String) {
        if input.isEmpty {
            // discard 'self' and return 'nil'
            return nil
        }
        property = input
    }
}


if let actualInstance = SomeStruct(input: "Hello") {
// do something with the instance of 'SomeStruct'
} else {
    // initialization of 'SomeStruct' failed and the initializer returned 'nil'
}


//Conditional Conformance
protocol Loggable {
    func log()
}
extension Loggable {
    func log() {
        print(self)
    }
}

protocol TitledLoggable: Loggable {
    static var logTitle: String { get }
}
extension TitledLoggable {
    func log() {
        print("\(Self.logTitle): \(self)")
    }
}

struct Pair<T>: CustomStringConvertible {
    let first: T
    let second: T
    var description: String {
        return "(\(first), \(second))"
    }
}

extension Pair: Loggable where T: Loggable { }
extension Pair: TitledLoggable where T: TitledLoggable {
    static var logTitle: String {
        return "Pair of '\(T.logTitle)'"
    }
}

extension String: TitledLoggable {
    static var logTitle: String {
        return "String"
    }
}

//Conforms to Loggable and TiltedLoggable
let oneAndTwo = Pair(first: "one", second: "two")
// Call log function on TiltedLoggable extension log() function
//Begin "Pair of
// Compute self.logTitle which is "String"
//Print out the 'self' which is the reference to the object -> (one, two)
oneAndTwo.log()
// Prints "Pair of 'String': (one, two)



//Conforms to Loggable

func doSomething<T: Loggable>(with x: T) {
    //Just prints 'self' which is (one,two)
    x.log()
}
doSomething(with: oneAndTwo)
// Prints "(one, two)


protocol Serializable {
    func serialize() -> Any
}

extension Array: Serializable where Element == Int {
    func serialize() -> Any {
        // implementation
    }
}
extension Array: Serializable where Element == String {
    func serialize() -> Any {
        // implementation
    }
}
// Error: redundant conformance of 'Array<Element>' to protocol 'Serializable


protocol MarkedLoggable: Loggable {
    func markAndLog()
}

extension MarkedLoggable {
    func markAndLog() {
        print("----------")
        log()
    }
}


//Without the below protocol conformace an error will be thrown for redudant conformation to the protocol Loggable. To avoid redundancy you must explicitly conform to the protocol as shown below.
extension Array: Loggable where Element: Loggable { }
extension Array: TitledLoggable where Element: TitledLoggable {
    static var logTitle: String {
        return "Array of '\(Element.logTitle)'"
    }
} 
extension Array: MarkedLoggable where Element: MarkedLoggable { }


//Operator Declaration
postfix operator --

precedencegroup myTestPrecedenceGroup{
    higherThan: //lower group names
    lowerThan: //higher group names
    associativity: //associativity
    assignment: //assignment
}




