import UIKit


var namesOfIntegers = [Int: String]()
namesOfIntegers[16] = "sixteen"
//Empty dictionary
namesOfIntegers = [:]

namesOfIntegers.count
namesOfIntegers.isEmpty

namesOfIntegers[16] = "sixteen"
//returns old value if there was one. Nil if not. Optional!
namesOfIntegers.updateValue("SIXTEEN", forKey: 16)


namesOfIntegers[16] = nil
namesOfIntegers[1] = "one"

namesOfIntegers.removeValue(forKey: 1)
namesOfIntegers[2] = "two"

for (number, numberWritten) in namesOfIntegers{
    print("The number \(number) is written as \(numberWritten)")
}

for number in namesOfIntegers.keys{
    print(number)
}

for numberWritten in namesOfIntegers.values{
    print(numberWritten)
}

//Make an array from dictionary keys
let numbersWritten = [Int] (namesOfIntegers.keys)





