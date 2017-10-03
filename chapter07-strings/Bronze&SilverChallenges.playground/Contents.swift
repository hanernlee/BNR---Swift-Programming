//: Playground - noun: a place where people can play

import UIKit

let playground = "Hello, playground"
var mutablePlayground = "Hello, mutable playground"
mutablePlayground += "!"

for c: Character in mutablePlayground.characters {
    print ("\(c)")
}

// Unicode scalars
let oneCoolDude = "\u{1F60e}"
let aAcute = "\u{0061}\u{0301}"

for scalar in playground.unicodeScalars {
    print("\(scalar.value)")
}

let acutePrecomposed = "\u{00E1}"

let b = (aAcute == acutePrecomposed) // canonical equivalence: Two sequences of Unicode scalars are the same linguistically

print("aAcute: \(aAcute.characters.count); acutePrecomposed: \(acutePrecomposed.characters.count)") // Same count canonical equivalence

// Indices Ranges
// Finding the 5th character
let start = playground.startIndex
let end = playground.index(start, offsetBy: 4) //offsetBy advance from starting point to 5th character
let fifthCharacter = playground[end]

let range = start...end
let firstFive = playground[range]

// Bronze Challenge

let empty:String = ""
let startEmpty = empty.startIndex
let endEmpty = empty.endIndex

empty.isEmpty

// Silver Challenge

let hello = "\u{0048}\u{0065}\u{006C}\u{006C}\u{006F}"

