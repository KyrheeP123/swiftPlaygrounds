//: Playground - noun: a place where people can play

import UIKit
/*
 
If you want to use line breaks to make your source code easier to read, but you don’t want the line breaks to be part of the string’s value, write a backslash (\) at the end of those lines:

 */

let softWrappedQuotation = """
The White Rabbit put on his spectacles.  "Where shall I begin, \
please your Majesty?" he asked.

"Begin at the beginning," the King said gravely, "and go on \
till you come to the end; then stop."
"""

/*
 
 To make a multiline string literal that begins or ends with a line feed, write a blank line as the first or last line.
 
 */

let lineBreaks = """

This string starts with a line break.
It also ends with a line break.

"""


//String Indexing
let greeting = "Guten Tag!"
greeting[greeting.startIndex]
// G
greeting[greeting.index(before: greeting.endIndex)]
// !
greeting[greeting.index(after: greeting.startIndex)]
// u
let index = greeting.index(greeting.startIndex, offsetBy: 7)
greeting[index]


for index in greeting.indices {
    print("\(greeting[index]) ", terminator: "")
}


var welcome = "hello"
welcome.insert("!", at: welcome.endIndex)
welcome.insert(contentsOf: " there", at: welcome.index(before: welcome.endIndex))
welcome.remove(at: welcome.index(before: welcome.endIndex))


let range = welcome.index(welcome.endIndex, offsetBy: -6)..<welcome.endIndex
welcome.removeSubrange(range)

#if swift(>=5.0)
    print("Hello, Swift 5.0")
    
#elseif swift(>=4.2)
    print("Hello, Swift 4.2")
    
#elseif swift(>=4.1)
    print("Hello, Swift 4.1")
    
#elseif swift(>=4.0)
print("Hello, Swift 4.0")
    
#elseif swift(>=3.2)
    print("Hello, Swift 3.2")
    
#elseif swift(>=3.0)
    print("Hello, Swift 3.0")
    
#elseif swift(>=2.2)
    print("Hello, Swift 2.2")
    
#elseif swift(>=2.1)
    print("Hello, Swift 2.1")
    
#elseif swift(>=2.0)
    print("Hello, Swift 2.0")
    
#elseif swift(>=1.2)
    print("Hello, Swift 1.2")
    
#elseif swift(>=1.1)
    print("Hello, Swift 1.1")
    
#elseif swift(>=1.0)
    print("Hello, Swift 1.0")
    
#endif


//Substrings
let newGreeting = "Hello, world!"

//let indexOfFirstCharacter = newGreeting.firstIndex(of: ",") ?? greeting.endIndex, Swift 4.2
let indexOfFirstCharacter = newGreeting.index(of: ",") ?? greeting.endIndex
let beginning = newGreeting[..<indexOfFirstCharacter]

// Convert the result to a String for long-term storage.
let newString = String(beginning)


//String Comparison of Suffix & Prefix
let romeoAndJuliet = [
    "Act 1 Scene 1: Verona, A public place",
    "Act 1 Scene 2: Capulet's mansion",
    "Act 1 Scene 3: A room in Capulet's mansion",
    "Act 1 Scene 4: A street outside Capulet's mansion",
    "Act 1 Scene 5: The Great Hall in Capulet's mansion",
    "Act 2 Scene 1: Outside Capulet's mansion",
    "Act 2 Scene 2: Capulet's orchard",
    "Act 2 Scene 3: Outside Friar Lawrence's cell",
    "Act 2 Scene 4: A street in Verona",
    "Act 2 Scene 5: Capulet's mansion",
    "Act 2 Scene 6: Friar Lawrence's cell"
]


var act1SceneCount = 0
for scene in romeoAndJuliet {
    if scene.hasPrefix("Act 1 ") {
        act1SceneCount += 1
    }
}
print("There are \(act1SceneCount) scenes in Act 1")


var mansionCount = 0
var cellCount = 0
for scene in romeoAndJuliet {
    if scene.hasSuffix("Capulet's mansion") {
        mansionCount += 1
    } else if scene.hasSuffix("Friar Lawrence's cell") {
        cellCount += 1
    }
}
print("\(mansionCount) mansion scenes; \(cellCount) cell scenes")




