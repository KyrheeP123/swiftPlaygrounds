import UIKit

//Arrays and Collections
var threeDoubles = Array(repeating: 0.0, count: 3)
var anotherThreeDoubles = Array(repeating: 3.0, count: 3)

    //Adding Arrays with + operator
let addedDoubles = threeDoubles + anotherThreeDoubles


var shoppingList = ["Eggs", "Milk"]
shoppingList.count
shoppingList.isEmpty

shoppingList.append("Flour")
shoppingList += ["Baking Powder"]
shoppingList += ["Chocolate Spread", "Butter", "Cheese"]
shoppingList[4...6] = ["Bananas", "Apples"]
shoppingList
shoppingList.insert("Maple Syrup", at: 0)
let mapleSyrup = shoppingList.remove(at: 0)
let apples = shoppingList.removeLast()

for item in shoppingList{
    print(item)
}

for (index, item) in shoppingList.enumerated(){
    print("The index of \(item) is \(index)")
}




