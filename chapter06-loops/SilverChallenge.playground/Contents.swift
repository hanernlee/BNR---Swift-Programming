//: Playground - noun: a place where people can play

import UIKit

var myFirstInt: Int = 0

/**
 * For Loop
 */
// can use _ instead of i
for _ in 1...5 {
    myFirstInt += 1
    myFirstInt
//  print("myFirstInt equals \(myFirstInt) at iteration \(i)")
    print(myFirstInt)
}

for i in 1...100 where i % 3 == 0 {
    print(i)
}

/**
 * While Loop
 */
var i = 1
while i < 6 {
    myFirstInt += 1
    print(myFirstInt)
    i += 1
}

var shields = 5
var blastersOverheating = false
var blasterFireCount = 0
var spaceDemonsDestroyed = 0

while shields > 0 {
    if spaceDemonsDestroyed == 10 {
        print("You beat the game!")
        break
    }
    
    if (blastersOverheating) {
        print("Blasters are overheated. Cooldown initiated")
        sleep(5)
        print("Blasters ready to fire")
        sleep(1)
        blastersOverheating = false
        blasterFireCount = 0
    }
    
    if (blasterFireCount > 100) {
        blastersOverheating = true
        continue // jumps back to top of the loop
    }
    
    print("Fire Blasters!")
    
    blasterFireCount += 1
    spaceDemonsDestroyed += 1
}

// Silver Challenge

for i in 1...100 {
    if (i % 3 == 0) {
        print("FIZZ")
    } else if (i % 5 == 0) {
        print("BUZZ")
    } else if (i % 15 == 0) {
        print ("FIZZ BUZZ")
    } else {
        print(i)
    }
}


var j: Int = 1
// Switch
while j <= 10 {
    let divisibleBy3 = number % 3
    let divisibleBy5 = number % 5
    let divisibles = (divisibleBy3, divisibleBy5)
    switch (divisibles) {
    case (0, _):
        print("FIZZ")
    case(_, 0):
        print("BUZZ")
    case(0, 0):
        print("FIZZ BUZZ")
    default:
        print("\(j)")
    }
    j += 1
}






