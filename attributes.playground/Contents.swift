import UIKit


//Dynamic Member lookup during runtime, must implement the subsript(dynamicMember)
@dynamicMemberLookup
struct DynamicStruct {
    let dictionary = ["someDynamicMember": 325,
                      "someOtherMember": 787]
    subscript(dynamicMember member: String) -> Int {
        return dictionary[member] ?? 1054
    }
}
let s = DynamicStruct()

// Using dynamic member lookup
let dynamic = s.someDynamicMember
print(dynamic)
// Prints "325"

// Calling the underlying subscript directly
let equivalent = s[dynamicMember: "someDynamicMember"]
print(dynamic == equivalent)
// Prints "true


//Swift 5 -
//Dynamically Callable
//@dynamicCallable
struct TelephoneExchange {
    func dynamicallyCall(withArguments phoneNumber: [Int]) {
        if phoneNumber == [4, 1, 1] {
            print("Get Swift help on forums.swift.org")
        } else {
            print("Unrecognized number")
        }
    }
}

let dial = TelephoneExchange()

// Use a dynamic method call.
//dial(4, 1, 1)
// Prints "Get Swift help on forums.swift.org".

//dial(8, 6, 7, 5, 3, 0, 9)
// Prints "Unrecognized number".

// Call the underlying method directly.
dial.dynamicallyCall(withArguments: [4, 1, 1])


//@dynamicCallable
struct Repeater {
    func dynamicallyCall(withKeywordArguments pairs: KeyValuePairs<String, Int>) -> String {
        return pairs
            .map { label, count in
                repeatElement(label, count: count).joined(separator: " ")
            }
            .joined(separator: "\n")
    }
}

let repeatLabels = Repeater()
print(repeatLabels(a: 1, b: 2, c: 3, b: 2, a: 1))
// a
// b b
// c c c
// b b
// a
