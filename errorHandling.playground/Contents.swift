import UIKit

//Representing and Throwing Errors
//All errors to be thrown in Swift must adhere to the Error protocol
enum VendingMachineError: Error{
    case invalidSelection
    case insufficientFunds(coinsNeeded: Int)
    case outOfStock
}


//How to throw an error. This will propogate that 5 additional coins are needed
//Commented out because it ends the execution of the playground
//throw(VendingMachineError.insufficientFunds(coinsNeeded: 5))

//Handling Errors

//Throwing Functions
// func canThrowErrors() throws -> String{}

//Cannot throw an error
//fun cannotThrowErrors() -> String()

struct Item{
    var price: Int
    var count: Int
}

class VendingMachine{
    //String: Item dictionary
    var inventory = [
        "Candy Bar": Item(price: 12, count: 7),
        "Chips": Item(price: 10, count: 4),
        "Pretzels": Item(price: 7, count: 11)
    ]
    var coinsDeposited = 0
    
    func vend(itemNamed name: String) throws {
        //the condition let item = inventory[name] must be true because were using a guard statement. In this case, the name of the invetory item must exist in order for item to be set to inventory[item]. Guard statements always have an else statement which is executed if the boolean condition is not true.
        guard let item = inventory[name] else {
            throw VendingMachineError.invalidSelection
        }
        
        guard item.count > 0 else {
            throw VendingMachineError.outOfStock
        }
        
        guard item.price <= coinsDeposited else {
            throw VendingMachineError.insufficientFunds(coinsNeeded: item.price - coinsDeposited)
        }
        
        coinsDeposited -= item.price
        
        //Need to create new item because it is a 'let' constant
        var newItem = item
        newItem.count -= 1
        inventory[name] = newItem
        
        print("Dispensing \(name)")
    }
}

var testVendingMachine = VendingMachine()
//Buy Candy Bar
testVendingMachine.coinsDeposited = 12
//Vend Candy Bar
//If this function throws an error it ends the program execution
try testVendingMachine.vend(itemNamed: "Candy Bar")




func guranteedVendingPurchase(itemNamed name: String){
    let vendingMachine = VendingMachine()
    var vendingItem = vendingMachine.inventory[name]!
    
    //If the count of the item we picked is == 1 then we will increase the count to ensure we get the item from the vending machine!
    if vendingItem.count <= 0 {
        vendingItem.count += 1
    }
    
    vendingMachine.coinsDeposited = vendingItem.price
    //I have set the proper fields to ensure an item is vended, therefore, there's no need prepend try or try? to function. I know this call to vend will succeed everytime. Use Case: Chipotle Black card for influencers
    try! vendingMachine.vend(itemNamed: name)
    vendingItem.count += 1
}

guranteedVendingPurchase(itemNamed: "Pretzels")


//Manipulate count, itemCounted, and name of vending item to see propagated errors from VendingMaching:guard
func errorsFromVendingMachineCanBeThrownHere(itemNamed name: String, vendingMachine: VendingMachine) throws {
    try vendingMachine.vend(itemNamed: name)
}

var vendingMachine = VendingMachine()
//try errorsFromVendingMachineCanBeThrownHere(itemNamed: "Hot Dogs",vendingMachine: vendingMachine)

struct PurchasedSnack {
    let name: String
    init(name: String, vendingMachine: VendingMachine) throws {
        try vendingMachine.vend(itemNamed: name)
        self.name = name
    }
}

let favoriteSnacks = [
    "Alice": "Chips",
    "Bob": "Licorice",
    "Eve": "Pretzels",
]

func buyFavoriteSnack(person: String, vendingMachine: VendingMachine) throws {
    let snackName = favoriteSnacks[person] ?? "Candy Bar"
    try vendingMachine.vend(itemNamed: snackName)
}


var doCatchVendingMachine = VendingMachine()
doCatchVendingMachine.coinsDeposited = 8
do {
    try buyFavoriteSnack(person: "Alice", vendingMachine: doCatchVendingMachine)
    print("Success! Yum.")
} catch VendingMachineError.invalidSelection {
    print("Invalid Selection.")
} catch VendingMachineError.outOfStock {
    print("Out of Stock.")
} catch VendingMachineError.insufficientFunds(let coinsNeeded) {
    print("Insufficient funds. Please insert an additional \(coinsNeeded) coins.")
} catch {
    print("Unexpected error: \(error).")
}
// Prints "Insufficient funds. Please insert an additional 2 coins.


func nourish(with item: String) throws {
    do {
        try doCatchVendingMachine.vend(itemNamed: item)
    } catch is VendingMachineError {
        print("Invalid selection, out of stock, or not enough money.")
    }
}

do {
    try nourish(with: "Beet-Flavored Chips")
} catch {
    print("Unexpected non-vending-machine-related error: \(error)")
}
// Prints "Invalid selection, out of stock, or not enough money.
