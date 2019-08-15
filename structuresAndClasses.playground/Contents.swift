import UIKit

struct Resolution {
    var width = 0
    var height = 0
}


class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}


let someResolution = Resolution()
let someVideoMode = VideoMode()


print("The width of someResolution is \(someResolution.width)")
someVideoMode.resolution.width = 1280
print("The width of someVideoMode is now \(someVideoMode.resolution.width)")


//Memberwise Initializers - FOR STRUCTURES ONLY
let vga = Resolution(width: 640, height: 480)


//Structures & Enumerations are Value Type NOT Reference Type
let hd = Resolution(width: 1920, height: 1080)
var cinema = hd


//When new copy of Resolution object is created. Right before modification
cinema.width = 2048

print("cinema is now \(cinema.width) pixels wide")
print("hd is still \(hd.width) pixels wide")

//Enumerations display the same type of above effor because they are Value Types
enum CompassPoint {
    case north, south, east, west
    mutating func turnNorth() {
        self = .north
    }
}


var currentDirection = CompassPoint.west
let rememberedDirection = currentDirection
currentDirection.turnNorth()

print("The current direction is \(currentDirection)")
print("The remembered direction is \(rememberedDirection)")


//Displays Classes are Reference Types that point to the same existing object
let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0


//New variable with a different name
let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30.0

print("The frameRate property of tenEighty is now \(tenEighty.frameRate)")


//Checking if variable or constant refer to the same object using === or not !===
if tenEighty === alsoTenEighty {
    print("tenEighty and alsoTenEighty refer to the same VideoMode instance.")
}



