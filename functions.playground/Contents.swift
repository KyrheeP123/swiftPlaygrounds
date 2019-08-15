import UIKit

//Functions
//Overloaded Function
func greet(_ person: String) -> String {
    return "Hello, " + person + "!"
}


func greetAgain(_ person: String) -> String {
    return "Hello again, " + person + "!"
}


func sayHelloWorld() -> String {
    return "hello, world"
}


//Overloaded Function

func greet(person: String, alreadyGreeted: Bool) -> String {
    if alreadyGreeted {
        return greetAgain(person)
    } else {
        return greet(person)
    }
}

func printAndCount(string: String) -> Int {
    print(string)
    return string.count
}

//Ignores the return type with the unlabelled keycharacter '_'
func printWithoutCounting(string: String) {
    let _ = printAndCount(string: string)
}


//Multiple Return Types - Using Tuple
//Safety-Check Function Definition
//func minMax(array: [Int]) -> (min: Int, max: Int)? {
func minMax(array: [Int]) -> (min: Int, max: Int) {
    //Safety-Check
    // if array.isEmpty { return nil }
    
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}


//“Note that the tuple’s members do not need to be named at the point that the tuple is returned from the function, because their names are already specified as part of the function’s return type.”
let bounds = minMax(array: [8, -6, 2, 109, 3, 71])
print("min is \(bounds.min) and max is \(bounds.max)")


//Optional Binding for optional Tuple function minMax
//if let bounds = minMax(array: [8, -6, 2, 109, 3, 71]) {
//    print("min is \(bounds.min) and max is \(bounds.max)")
//}


//Argument Labels
//func greet(person: String, from hometown: String) -> String {
//    return "Hello \(person)!  Glad you could visit from \(hometown)."
//}
//print(greet(person: "Bill", from: "Cupertino"))


//Default Parameter Values
func someFunction(parameterWithoutDefault: Int, parameterWithDefault: Int = 12) {
    // If you omit the second argument when calling this function, then
    // the value of parameterWithDefault is 12 inside the function body.
}
someFunction(parameterWithoutDefault: 3, parameterWithDefault: 6) // parameterWithDefault is 6
someFunction(parameterWithoutDefault: 4) // parameterWithDefault is 12


//Variadic Parameters - Parameter for a function may be more than one value
//A function can have at most one variadic parameter
func arithmeticMean(_ numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}
arithmeticMean(1, 2, 3, 4, 5)
// returns 3.0, which is the arithmetic mean of these five numbers
arithmeticMean(3, 8.25, 18.75)


//To take IN a value, then modify, finally past OUT the modified paremeter the parameter must be labelled inout

func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")


//Function Types
//Type of (Int, Int) -> Int
func addTwoInts(_ a: Int, _ b: Int) -> Int {
    return a + b
}

func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
    return a * b
}

var mathFunction: (Int,Int) -> Int = addTwoInts
print("Result: \(mathFunction(2,3))")

//Assigning variable to the same function type
mathFunction = multiplyTwoInts
print("Result: \(mathFunction(2, 3))")


//Functions Types as parameters
func printMathResult(_ mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    print("Result: \(mathFunction(a, b))")
}
printMathResult(addTwoInts, 3, 5)


func stepForward(_ input: Int) -> Int {
    return input + 1
}
func stepBackward(_ input: Int) -> Int {
    return input - 1
}

//If backward is true stepBackward. If not, stepForward
func chooseStepFunction(backward: Bool) -> (Int) -> Int {
    return backward ? stepBackward : stepForward
}


//Nested Functions
func chooseStepFunction1(backward: Bool) -> (Int) -> Int {
    func stepForward(input: Int) -> Int { return input + 1 }
    func stepBackward(input: Int) -> Int { return input - 1 }
    return backward ? stepBackward : stepForward
}

var currentValue = -4
let moveNearerToZero = chooseStepFunction1(backward: currentValue > 0)
// moveNearerToZero now refers to the nested stepForward() function
while currentValue != 0 {
    print("\(currentValue)... ")
    currentValue = moveNearerToZero(currentValue)
}
print("zero!")


