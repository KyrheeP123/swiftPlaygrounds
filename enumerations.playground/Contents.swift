import UIKit

enum CompassPoint {
    case north
    case south
    case east
    case west
}

enum Planet {
    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
}

var directionToHead = CompassPoint.south

//Switch case with exhaustive cases
switch directionToHead {
case .north:
    print("Lots of planets have a north")
case .south:
    print("Watch out for penguins")
case .east:
    print("Where the sun rises")
case .west:
    print("Where the skies are blue")
}


//Switch case with default case
let somePlanet = Planet.earth

switch somePlanet {
case .earth:
    print("Mostly harmless")
default:
    print("Not a safe place for humans")
}


//Iterating over Enumeration cases
enum Beverage: CaseIterable {
    case coffee, tea, juice
}
let numberOfChoices = Beverage.allCases.count
print("\(numberOfChoices) beverages available")


for beverage in Beverage.allCases {
    print(beverage)
}


//Specifying types for enumeration cases
enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}


var productBarcode = Barcode.upc(8, 85909, 51226, 3)
productBarcode = .qrCode("ABCDEFGHIJKLMNOP")


//Switch case on Enumeration instance
switch productBarcode {
    
case .upc(let numberSystem, let manufacturer, let product, let check):
    print("UPC: \(numberSystem), \(manufacturer), \(product), \(check).")
case .qrCode(let productCode):
    print("QR code: \(productCode).")
    
}


//If all variables constant or variable can be tagged with the 'let' or 'var' keyword once
switch productBarcode {
case let .upc(numberSystem, manufacturer, product, check):
    print("UPC : \(numberSystem), \(manufacturer), \(product), \(check).")
case let .qrCode(productCode):
    print("QR code: \(productCode).")
}


//Passing Raw Values to Enumeration cases. (Of the same type)
enum ASCIIControlCharacter: Character{
    case tab = "\t"
    case lineFeed = "\n"
    case carriageReturn = "\r"
}


//Mercury Raw Value is 1, venus implicit value is 2
enum PlanetImplicit: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
}
let planet = PlanetImplicit.earth.rawValue
let possiblePlanet = PlanetImplicit(rawValue: 7)


//Implicit Raw Value after declaring the cases of type String. Implicit Raw values are equal to name of case
enum CompassPointImplicit: String {
    case north, south, east, west
}
let north = CompassPointImplicit.north.rawValue


let positionToFind = 11
//Initializer returns optional so optional binding statement used
if let somePlanet = PlanetImplicit(rawValue: positionToFind) {
    switch somePlanet {
    case .earth:
        print("Mostly harmless")
    default:
        print("Not a safe place for humans")
    }
} else {
    print("There isn't a planet at position \(positionToFind)")
}


//Recursive Enumeration - type for case is the specified enumeration
enum ArithmeticExpression {
    case number(Int)
    indirect case addition(ArithmeticExpression, ArithmeticExpression)
    indirect case multiplication(ArithmeticExpression, ArithmeticExpression)
}


//The above Enumeration can be stated as such below
indirect enum ArithmeticExpressionIndirect {
    case number(Int)
    case addition(ArithmeticExpressionIndirect, ArithmeticExpressionIndirect)
    case multiplication(ArithmeticExpressionIndirect, ArithmeticExpressionIndirect)
}

let five = ArithmeticExpression.number(5)
let four = ArithmeticExpression.number(4)
let sum = ArithmeticExpression.addition(five, four)
let product = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))


//Function to evaluate ArithmeticExpression
func evaluate(_ expression: ArithmeticExpression) -> Int {
    switch expression {
    case let .number(value):
        return value
    case let .addition(left, right):
        return evaluate(left) + evaluate(right)
    case let .multiplication(left, right):
        return evaluate(left) * evaluate(right)
    }
}


