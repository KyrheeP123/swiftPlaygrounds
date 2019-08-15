import UIKit

//ARC in action
class Person {
    //Property
    let name: String
    //Methon
    init(name: String) {
        self.name = name
        print("\(name) is being initialized")
    }
    //Method
    deinit {
        print("\(name) is being deinitialized")
    }
}


//Optional Person objects with no object so no reference in memory
var reference1: Person?
var reference2: Person?
var reference3: Person?


//Three strong references, memory allocated to reference1 Person will not be deallocated and is kept in memory
reference1 = Person(name: "John Appleseed")
reference2 = reference1
reference3 = reference1


//Deference from Person twice, one reference to Person left so not deallocated
reference1 = nil
reference2 = nil


//Deferencing the last reference to Person. All strong references broken, memory deallocated
reference3 = nil







