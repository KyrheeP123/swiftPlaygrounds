import UIKit



//Getters and Setters
struct TrackedString {
    private(set) var numberOfEdits = 0
    var value: String = "" {
        didSet {
            numberOfEdits += 1
        }
    }
}


var stringToEdit = TrackedString()
stringToEdit.value = "This string will be tracked."
stringToEdit.value += " This edit will increment numberOfEdits."
stringToEdit.value += " So will this one."
print("The number of edits is \(stringToEdit.numberOfEdits)")
// Prints "The number of edits is 3


public struct TrackedString {
    public private(set) var numberOfEdits = 0
    public var value: String = "" {
        didSet {
            numberOfEdits += 1
        }
    }
    public init() {}
}


public class SomePublicClass {                  // explicitly public class
    public var somePublicProperty = 0            // explicitly public class member
    var someInternalProperty = 0                 // implicitly internal class member
    fileprivate func someFilePrivateMethod() {}  // explicitly file-private class member
    private func somePrivateMethod() {}          // explicitly private class member
}

class SomeInternalClass {                       // implicitly internal class
    var someInternalProperty = 0                 // implicitly internal class member
    fileprivate func someFilePrivateMethod() {}  // explicitly file-private class member
    private func somePrivateMethod() {}          // explicitly private class member
}

fileprivate class SomeFilePrivateClass {        // explicitly file-private class
    func someFilePrivateMethod() {}              // implicitly file-private class member
    private func somePrivateMethod() {}          // explicitly private class member
}

private class SomePrivateClass {                // explicitly private class
    func somePrivateMethod() {}                  // implicitly private class member
}


//Access Control Syntax
public class SomePublicClass {}
internal class SomeInternalClass {}
fileprivate class SomeFilePrivateClass {}
private class SomePrivateClass {}

public var somePublicVariable = 0
internal let someInternalConstant = 0
fileprivate func someFilePrivateFunction() {}
private func somePrivateFunction() {}


class SomeInternalClass {}              // implicitly internal
let someInternalConstant = 0            // implicitly internal


//Function Types
//The Access Control for this function needs to be clearly stated to compile and it has to match it's most restrictive return type. In this case, it's private
func someFunction() -> (SomeInternalClass, SomePrivateClass) {
    // function implementation goes here
}


private func someFunction() -> (SomeInternalClass, SomePrivateClass) {
    // function implementation goes here
}


//Enumeration Types
//CompassPoint is public so are it's cases then by default. This can be modified.
public enum CompassPoint {
    case north
    case south
    case east
    case west
}


//Subclassing can't have higher access control then it's superclass. A member of the superclass can be overrided to a different access control than it's superclass
public class A {
    fileprivate func someMethod() {}
}

internal class B: A {
    override internal func someMethod() {}
}


public class A {
    fileprivate func someMethod() {}
}

internal class B: A {
    override internal func someMethod() {
        //Subclass can call the function (and other superclass memebers) of a lower access level as long as it's in the same context. In this case, the same file.
        super.someMethod()
    }
}


//Constants, Variables, Properties, and Subscripts - in the case below if it makes use of a private type then it must be defined as private.
private var privateInstance = SomePrivateClass()


protocol SomeProtocol {
    func doSomething()
}


struct SomeStruct {
    private var privateVariable = 12
}


extension SomeStruct: SomeProtocol {
    func doSomething() {
        print(privateVariable)
    }
}



