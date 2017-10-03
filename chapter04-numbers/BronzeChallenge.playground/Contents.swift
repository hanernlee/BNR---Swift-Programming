//: Playground - noun: a place where people can play

import UIKit

// 64-bit
print("The maximum Int value is \(Int.max).")
print("The minimum Int value is \(Int.min).")

// 32-bit
print("The maximum value for a 32-bit Integer is \(Int32.max).")
print("The minimum value for a 32-bit Integer is \(Int32.min).")

// Unsigned Integer Types
print("The maximum UInt value is \(UInt.max).")
print("The minimum UInt value is \(UInt.min).")
print("The maximum value for a 32-bit unsigned Integer is \(UInt32.max).")
print("The minimum value for a 32-bit unsigned Integer is \(UInt32.min).")

let numberOfPages: Int = 10
let numberOfChapters = 3 //infereed

let numberOfPeople: UInt = 40
let volumeAdjustment: Int32 = -1000

// Overflow Operators
let y: Int8 = 120
let z = y &+ 10 // 130 will be too big so it wraps around
print("120 &+ 10 is \(z)")

/**
 Bronze Challenge
 */
// Binary Representation of -1 using an 8-bit signed Integer ?
// Solution
//  [1] [1] [1] [1] [1] [1] [1] [1]
// -2^7 2^6 2^5 2^4 2^3 2^2 2^1 2^0
// -128 + 64 + 32 + 16 + 8 + 4 + 2 + 1 = -1

// Take the same pattern and interpret as an 8-bit unsigned Integer?
// Solution
//  [1] [1] [1] [1] [1] [1] [1] [1]
//  2^7 2^6 2^5 2^4 2^3 2^2 2^1 2^0
// 128 + 64 + 32 + 16 + 8 + 4 + 2 + 1 = 255
// Alternatively can use formula of 2^n - 1 this would mean 2 ^ 8 - 1
