import UIKit


class Person{
    var residence: Residence?
}

class Residence{
    var numberOfRooms = 1
}

let john = Person()
let bob = Person()
//Forced Unwrapping Trigger Runtime Error
//let roomCount = john.residence!.numberOfRooms

//To provide person instance with Residence, comment to fail
john.residence = Residence()
bob.residence = Residence()

if let roomCount = john.residence?.numberOfRooms, let bobroomCount = bob.residence?.numberOfRooms{
    print("John has \(roomCount) room(s)")
    print("John has \(bobroomCount) room(s)")
}
else{
    print("Unable to retrieve number of rooms")
}

class ComplexResidence{
    var rooms = [Room]()
    var numberOfRooms:Int{
        return rooms.count
    }
    
    //Subscript is indexing with the '[]'
    subscript(i: Int) -> Room{
        get{
            return rooms[i]
        }
        
        set{
            rooms[i] = newValue
        }
    }
    
    func printNumberOfRooms() {
        print("The number of rooms is \(numberOfRooms)")
    }
    var address: Address?
}


class Room{
    let name: String
    init(name: String) {
        self.name = name
    }

}

class Address{
    var buildingName: String?
    var buildingNumber: String?
    var street: String?
    
    func buildingIdentifier() -> String?{
        if let buildingNumber = buildingNumber, let street = street{
            return "\(buildingNumber)\(street)"
        }
        else if buildingName != nil{
            return buildingName
        }
        else{
            return nil
        }
        
    }
    
    
}

class SecondPerson{
    var residence: ComplexResidence?
}


let secondJohn = SecondPerson()
//Residence is still nil
if let roomCount = secondJohn.residence?.numberOfRooms {
    print("John has \(roomCount) room(s)")
}
else{
    print("Unable to retrieve number of rooms")
}

let someAddress = Address()
someAddress.buildingName = "Acadia Drive"
someAddress.buildingNumber = "20 "
//Residence is still nil
secondJohn.residence?.numberOfRooms


func createAddress() -> Address{
    print("Create Address Function Called")
    
    let someAddress = Address()
    
    someAddress.buildingNumber = "29"
    someAddress.buildingName = "Acacia Drive"
    return someAddress
}
//Function was not called because residence is still nil
secondJohn.residence?.address = createAddress()

//Check if it was possible to call the printNumberOfRooms Function even though does not have a return value. This behavior exists because of ComplexResidence being an Optional type
if secondJohn.residence?.printNumberOfRooms() != nil {
    print("It was possible to print the number of rooms.")
} else {
    print("It was not possible to print the number of rooms.")
}
// Prints "It was not possible to print the number of rooms.


if (secondJohn.residence?.address = someAddress) != nil {
    print("It was possible to set the address.")
} else {
    print("It was not possible to set the address.")
}
// Prints "It was not possible to set the address.

//Residence was still nil
if let firstRoomName = secondJohn.residence?[0].name {
    print("The first room name is \(firstRoomName).")
} else {
    print("Unable to retrieve the first room name.")
}


// Assigning the Complex Residence Class to secondJohn to replace the value of nill
let johnsHouse = ComplexResidence()
johnsHouse.rooms.append(Room(name: "Living Room"))
johnsHouse.rooms.append(Room(name: "Kitchen"))
secondJohn.residence = johnsHouse


//Can get the first index
if let firstRoomName = secondJohn.residence?[0].name {
    print("The first room name is \(firstRoomName).")
} else {
    print("Unable to retrieve the first room name.")
}
// Prints "The first room name is Living Room.


