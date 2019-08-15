//: Playground - noun: a place where people can play

import UIKit

//Declaring Variables and Constants
let maxLoginAttempts = 10
var currentLoginAttempts = 0

    //Multiplie Variable or Constant Declarations
var x = 2, y = 5

let originX = 0, originY = 0

    //Type Annotations
var a, b, c: Double


//Comments

    //Single Line Comment
    /*
    MultiLine Comment
 
    /*
    Nested MultiLine Comment!
 */
 */


//Execute multiple statements on one line
let cat = "🐈"; print(cat)


//Type Alias
typealias AudioSample = UInt16
var amplitudeFound = AudioSample.min


//Ignoring Tuple Value
let (myName, _) = ("Kyrhee", "Powell")
myName

    //Index Tuple
let myTuple = ("Kyrhee", "Powell")
myTuple.0


//Optionals
let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)


    //Force Unwrapping
if convertedNumber != nil {
    print("convertedNumber has an integer value of \(convertedNumber!).")
}


    //Optinal Binding
if let _ = convertedNumber {
    print("convertedNumber has an integer value of \(convertedNumber!).")
}

//if let constantName = someOptional {
//    statements
//}

var myOptional:Int? = 3

while myOptional != nil{
    print("Not nil!")
    myOptional = nil
}


    //Implicit Optionals
// requires an exclamation mark
let possibleString: String? = "An optional string."
let forcedString: String = possibleString!

// no need for an exclamation mark”
let assumedString: String! = "An implicitly unwrapped optional string."
let implicitString: String = assumedString


//Assertions and Preconditions
/*
    Assertions checked during debug builds.
    Preconditions checked during debug builds and productions builds.
 */

let age = -3
//assert(age >= 0, "A person's age can't be less than zero.")


    //Use assertionFailure because code checks for negative age
if age > 10 {
    print("You can ride the roller-coaster or the ferris wheel.")
} else if age >= 0 {
    print("You can ride the ferris wheel.")
} else {
    //assertionFailure("A person's age can't be less than zero.")
}


/*
 
 Use a precondition whenever a condition has the potential to be false, but must definitely be true for your code to continue execution.
 
 */
var index = 1
precondition(index > 0, "Index must be greater than zero.")


//Comparing References for objects === or !==


//Ternary Operators - Form
/*
 
if question {
    answer1
} else {
    answer2
}
 
 */


let contentHeight = 40
let hasHeader = true
let rowHeight = contentHeight + (hasHeader ? 50 : 20)


//One-Sided Ranges
let names = ["Anna", "Alex", "Brian", "Jack"]

for name in names[2...] {
    print(name)
}

for name in names[..<2] {
    print(name)
}


//Logical Operators
/*
 NOT -> !a
 AND -> &&
 OR -> ||
 
 
 */



