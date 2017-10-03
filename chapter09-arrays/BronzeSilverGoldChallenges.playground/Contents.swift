//: Playground - noun: a place where people can play

import UIKit

var bucketList = ["Climb Mt. Everest"]

//bucketList.append("Fly hot air balloon to Fiji")
//bucketList.append("Watch Lord of The Rings Trilogy in one day")
//bucketList.append("Go on a walkabouts")
//bucketList.append("Scuba dive in the Great Blue Hole")
//bucketList.append("Find a triple rainbow")

var newItems = [
    "Fly hot air balloon to Fiji",
    "Watch Lord of The Rings Trilogy in one day",
    "Go on a walkabout",
    "Scuba dive in the Great Blue Hole",
    "Find a triple rainbow"
]

//for item in newItems {
//    bucketList.append(item)
//}
bucketList += newItems // Refactor without loops
bucketList

bucketList.remove(at: 2)

print(bucketList.count) // Count
print(bucketList[0...2]) // Subscripting
bucketList[2] += " in Australia"

// Replacing array item
bucketList[0] = "Climb Mt. Kilimanjaro"

// Inserting
bucketList.insert("Tobaggan across Alaska", at: 2)
bucketList

// Array equality
var myronslist = [
    "Climb Mt. Kilimanjaro",
    "Fly hot air balloon to Fiji",
    "Tobaggan across Alaska",
    "Go on a walkabout in Australia",
    "Scuba dive in the Great Blue Hole",
    "Find a triple rainbow"
]

let equal = (bucketList == myronslist)

// Immutable Arrays

let lunches = [
    "Cheeseburger",
    "Veggie Pizza",
    "Chicken Caesar Salad",
    "Black Bean Burrito",
    "Falafel Wrap",
]

// BronzeChallenge
var toDoList = ["Take out garbage", "Pay bills", "Cross off finished items"]
toDoList.isEmpty // Check if contains any elements

// Silver Challenge
//var reversedArray = [String]()
//for item in toDoList {
//    reversedArray.insert(item, at: 0)
//}
//reversedArray
toDoList.reverse()
print(toDoList)


// Gold Challenge
var hotIndex = bucketList.index(of: "Fly hot air balloon to Fiji")
var newIndex = hotIndex! + 2
bucketList[newIndex]
















