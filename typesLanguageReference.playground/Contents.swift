import UIKit

func someFunction(left: Int, right: Int) {}
func anotherFunction(left: Int, right: Int) {}
func functionWithDifferentLabels(top: Int, bottom: Int) {}

var f = someFunction // The type of f is (Int, Int) -> Void, not (left: Int, right: Int) -> Void.
f = anotherFunction              // OK
f = functionWithDifferentLabels  // OK

func functionWithDifferentArgumentTypes(left: Int, right: String) {}
f = functionWithDifferentArgumentTypes     // Error

func functionWithDifferentNumberOfArguments(left: Int, right: Int, top: Int) {}
f = functionWithDifferentNumberOfArguments // Error

let external: (() -> Void) -> Void = { _ in () }
func takesTwoFunctions(first: (() -> Void) -> Void, second: (() -> Void) -> Void) {
    first { first {} }       // Error
    second { second {}  }    // Error
    
    first { second {} }      // Error
    second { first {} }      // Error
    
    first { external {} }    // OK
    external { first {} }    // OK
}


//Array Type
let someArray: Array<String> = ["Alex", "Brian", "Dave"]
let someArray: [String] = ["Alex", "Brian", "Dave"]

var array3D: [[[Int]]] = [[[1, 2], [3, 4]], [[5, 6], [7, 8]]]

print(array3D[0])
print(array3D[0][1])
print(array3D[0][1][1])


let someDictionary: [String: Int] = ["Alex": 31, "Paul": 39]
let someDictionary: Dictionary<String, Int> = ["Alex": 31, "Paul": 39]


//Optionals
var optionalInteger: Int?
var optionalInteger: Optional<Int>

optionalInteger = 42
optionalInteger! // 42

var implicitlyUnwrappedString: String!
var explicitlyUnwrappedString: Optional<String>


let tupleOfImplicitlyUnwrappedElements: (Int!, Int!)  // Error
let implicitlyUnwrappedTuple: (Int, Int)!             // OK

let arrayOfImplicitlyUnwrappedElements: [Int!]        // Error
let implicitlyUnwrappedArray: [Int]!


//Compound Protocols

//Protocols can show up more than once but duplicates are ignored
typealias PQ = P & Q
//Equivalent to P & Q & R
typealias PQR = PQ & Q & R


//MetaTypes
class SomeBaseClass {
    class func printClassName() {
        print("SomeBaseClass")
    }
}
class SomeSubClass: SomeBaseClass {
    override class func printClassName() {
        print("SomeSubClass")
    }
}
let someInstance: SomeBaseClass = SomeSubClass()
// The compile-time type of someInstance is SomeBaseClass,
// and the runtime type of someInstance is SomeSubClass
type(of: someInstance).printClassName()
// Prints "SomeSubClass


class AnotherSubClass: SomeBaseClass {
    let string: String
    required init(string: String) {
        self.string = string
    }
    override class func printClassName() {
        print("AnotherSubClass")
    }
}
let metatype: AnotherSubClass.Type = AnotherSubClass.self
//Construct an instance of the classes metaype value, to do so the init must be marked with 'required'
let anotherInstance = metatype.init(string: "some string")


//Type Inference



