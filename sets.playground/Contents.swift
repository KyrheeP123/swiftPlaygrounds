import UIKit

var mySet = Set<Character>()

var favoriteGenres: Set<String>  = ["Rock", "Classical", "Hip-Hop"]
favoriteGenres.count
favoriteGenres.isEmpty

//Add Elements
favoriteGenres.insert("Jazz")

//.remove is optional. Either a value of nil. The value is returned. Used below for optional binding.

if let removedGenre = favoriteGenres.remove("Rock") {
print("\(removedGenre)? I'm over it.")
} else {
    print("I never much cared for that.")
}


//Check if element in the set
favoriteGenres.contains("Rock")

//Iterating through Set
for genre in favoriteGenres{
    print(genre)
}

//Set Operations
favoriteGenres.intersection(["Rock"])
favoriteGenres.formSymmetricDifference(["Blue Grass", "Country"])
favoriteGenres.union(["Blue Grass", "Country"])
favoriteGenres.subtracting(["Classical","Rock", "Hip-Hop"])


let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]

oddDigits.union(evenDigits).sorted()
// [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
oddDigits.intersection(evenDigits).sorted()
// []
oddDigits.subtracting(singleDigitPrimeNumbers).sorted()
// [1, 9]
oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted()

let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals: Set = ["🐦", "🐭"]

houseAnimals.isSubset(of: farmAnimals)
// true
farmAnimals.isSuperset(of: houseAnimals)
// true
farmAnimals.isDisjoint(with: cityAnimals)
// true


