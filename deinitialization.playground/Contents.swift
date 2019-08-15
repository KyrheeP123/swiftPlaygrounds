//Deinitialization form NO parenthesis and NO parameters


//deinit {
    // perform the deinitialization
//}


class Bank {
    static var coinsInBank = 10_000
    static func distribute(coins numberOfCoinsRequested: Int) -> Int {
        //Choose the lesser value
        let numberOfCoinsToVend = min(numberOfCoinsRequested, coinsInBank)
        //Remaining coins in the bank
        coinsInBank -= numberOfCoinsToVend
        return numberOfCoinsToVend
    }
    //Add coins to the bank
    static func receive(coins: Int) {
        coinsInBank += coins
    }
}


class Player {
    var coinsInPurse: Int
    //Give each player the amount of coins requested
    init(coins: Int) {
        coinsInPurse = Bank.distribute(coins: coins)
    }
    //Add coins to the player's purse
    func win(coins: Int) {
        coinsInPurse += Bank.distribute(coins: coins)
    }
    //When player quits, add the coins back to the Bank
    deinit {
        Bank.receive(coins: coinsInPurse)
    }
}


var playerOne: Player? = Player(coins: 100)
print("A new player has joined the game with \(playerOne!.coinsInPurse) coins")
// Prints "A new player has joined the game with 100 coins"
print("There are now \(Bank.coinsInBank) coins left in the bank")
// Prints "There are now 9900 coins left in the bank


playerOne!.win(coins: 2_000)
print("PlayerOne won 2000 coins & now has \(playerOne!.coinsInPurse) coins")
// Prints "PlayerOne won 2000 coins & now has 2100 coins"
print("The bank now only has \(Bank.coinsInBank) coins left")
// Prints "The bank now only has 7900 coins left


//Deallocating the player.
playerOne = nil
print("PlayerOne has left the game")
// Prints "PlayerOne has left the game"
print("The bank now has \(Bank.coinsInBank) coins")
// Prints "The bank now has 10000 coins
