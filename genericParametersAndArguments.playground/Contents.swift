import UIKit

//The generic parameter T must conform to Comparable protocol
func simpleMax<T: Comparable>(_ x: T, _ y: T) -> T {
    if x < y {
        return y
    }
    return x
}


simpleMax(17, 42) // T is inferred to be Int
simpleMax(3.14159, 2.71828) //T is inferred to be Double


