import UIKit


//Computed Properties
extension Double {
    var km: Double { return self * 1_000.0 }
    var m: Double { return self }
    var cm: Double { return self / 100.0 }
    var mm: Double { return self / 1_000.0 }
    var ft: Double { return self / 3.28084 }
}

let aMarathon = 42.0.km + 195.m
print("A marathon is \(aMarathon) meters long")

let oneInch = 25.4.mm
print("One inch is \(oneInch) meters")

let threeFeet = 3.ft
print("Three feet is \(threeFeet) meters")

//Initializers
struct Size {
    var width = 0.0, height = 0.0
}
struct Point {
    var x = 0.0, y = 0.0
}

//Due to providing default values for all properties a default and memberwise initializer is provided automatically
struct Rect {
    var origin = Point()
    var size = Size()
}


let defaultRect = Rect()
let memberwiseRect = Rect(origin: Point(x: 2.0, y: 2.0),size: Size(width: 5.0, height: 5.0))


//Extending Rect with another initializer to specify it's center and size
extension Rect {
    init(center: Point, size: Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}

let centerRect = Rect(center: Point(x: 4.0, y: 4.0),size: Size(width: 3.0, height: 3.0))


//Methods
extension Int {
    //Parameter that takes a function with no paramters that doesn't return a value
    func repetitions(task: () -> Void) {
        for _ in 0..<self {
            task()
        }
    }
}

3.repetitions {
    print("hello")
}

extension Int {
    mutating func square() {
        self = self * self
    }
}
var someInt = 3
someInt.square()


extension Int {
    subscript(digitIndex: Int) -> Int {
        var decimalBase = 1
        for _ in 0..<digitIndex {
            decimalBase *= 10
        }
        return (self / decimalBase) % 10
    }
}

var digitIndexInt = 12345
digitIndexInt[2]


extension Int {
    enum Kind {
        case negative, zero, positive
    }
    var kind: Kind {
        switch self {
            case 0:
                return .zero
            case let x where x > 0:
                return .positive
            default:
                return .negative
            }
    }
}

0.kind
6.kind
Int(-1).kind




//Extension Syntax
extension SomeType {
    // new functionality to add to SomeType goes here
}


extension SomeType: SomeProtocol, AnotherProtocol {
    // implementation of protocol requirements goes here
}





