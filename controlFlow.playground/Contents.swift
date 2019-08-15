import UIKit

var str = "Hello, playground"


//For-In Loops
let minuteInterval = 5
let minutes = 60

//Stride - Open Range
for tickMark in stride(from: 0, to: minutes, by: minuteInterval) {
    // render the tick mark every 5 minutes (0, 5, 10, 15 ... 45, 50, 55)
    print(tickMark)
}


//Stride - Closed Range
for tickMark in stride(from: 0, through: minutes, by: minuteInterval) {
    // render the tick mark every 5 minutes (0, 5, 10, 15 ... 45, 50, 55, 60)
    print(tickMark)
}


//While Loops
//while condition {
//    statements
//}


//Repeat-While Loops
//Conditions are checked after every loop. Therefore, ensuring one loop before condition is checked
//repeat {
//    statements
//} while condition


//Switch Statements - Matches first case then breaks automatically
//switch some value to consider {
//    case value 1:
//    respond to value 1
//    case value 2, value 3:
//    respond to value 2 or 3
//    default:
//    otherwise, do something else
//}

let approximateCount = 62
let countedThings = "moons orbiting Saturn"


var naturalCount: String = ""
switch approximateCount {
case 0:
    naturalCount = "no"
case 1..<5:
    naturalCount = "a few"
case 5..<12:
    naturalCount = "several"
case 12..<100:
    naturalCount = "dozens of"
case 100..<1000:
    naturalCount = "hundreds of"
default:
    naturalCount = "many"
}


let somePoint = (1, 1)
switch somePoint {
case (0, 0):
    print("\(somePoint) is at the origin")
case (_, 0):
    print("\(somePoint) is on the x-axis")
case (0, _):
    print("\(somePoint) is on the y-axis")
case (-2...2, -2...2):
    print("\(somePoint) is inside the box")
default:
    print("\(somePoint) is outside of the box")
}


//Value Binding
let anotherPoint = (2, 0)
switch anotherPoint {
case (let x, 0):
    print("on the x-axis with an x value of \(x)")
case (0, let y):
    print("on the y-axis with a y value of \(y)")
//Case covers all values for tuple. No default case necssary.
case let (x, y):
    print("somewhere else at (\(x), \(y))")
}


//Where clauses in Switch statements
let yetAnotherPoint = (1, -1)
switch yetAnotherPoint {
case let (x, y) where x == y:
    print("(\(x), \(y)) is on the line x == y")
case let (x, y) where x == -y:
    print("(\(x), \(y)) is on the line x == -y")
case let (x, y):
    print("(\(x), \(y)) is just some arbitrary point")
}


//Control Flow Statements
/*
 continue - The continue statement tells a loop to stop what it is doing and start again at the beginning of the next iteration through the loop.
 break - ends execution of an entire control flow statement immediately.
    fallthrough - causes code execution to move directly to statements within the next case without checking the case condition
    return
    throw
 */


//Continue
let puzzleInput = "great minds think alike"
var puzzleOutput = ""
let charactersToRemove: [Character] = ["a", "e", "i", "o", "u", " "]
for character in puzzleInput {
    if charactersToRemove.contains(character) {
        continue
    }
    puzzleOutput.append(character)
}


//Labelled Statements - To utilize control flow statements within a nested loop of control flow block onto a particular labelled loop of control flow block

let finalSquare = 25
var board = [Int](repeating: 0, count: finalSquare + 1)
board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
var square = 0
var diceRoll = 0

//gameLoop is the label of the while loop
gameLoop: while square != finalSquare {
    diceRoll += 1
    if diceRoll == 7 { diceRoll = 1 }
    switch square + diceRoll {
    case finalSquare:
        // diceRoll will move us to the final square, so the game is over
        //Specifying the labelled loop preceded by the control flow statement
        break gameLoop
    case let newSquare where newSquare > finalSquare:
        // diceRoll will move us beyond the final square, so roll again
        //Specifying the labelled loop preceded by the control flow statement
        continue gameLoop
    default:
        // this is a valid move, so find out its effect
        square += diceRoll
        square += board[square]
    }
}
print("Game over!")


//Guard - Must result to true for it's following code to execute. Must always have a else cause
//return can be used inside of functions
func greet(person: [String: String]) {
    
    guard let name = person["name"] else {
        return
    }
    //'name' variable available after guard statement
    print("Hello \(name)!")
    
    guard let location = person["location"] else {
        print("I hope the weather is nice near you.")
        return
    }
    
    print("I hope the weather is nice in \(location).")
}

greet(person: ["name": "John"])





