//: Playground - noun: a place where people can play

import UIKit

var groceryBag: Set = ["Apples", "Oranges", "Pineapples"]

// inserts returns a tuple
//groceryBag.insert("Apples")
//groceryBag.insert("Oranges")
//groceryBag.insert("Pineapples")

for food in groceryBag {
    print("\(food)")
}

let hasBananas = groceryBag.contains("Bananas")

// Unions & Intersections & Disjoint
let friendsGroceryBag: Set = ["Bananas", "Cereal", "Milk", "Oranges"]
let commonGroceryBag = groceryBag.union(friendsGroceryBag)

let roommatesGroceryBag: Set = ["Apples", "Bananas", "Cereal", "Toothpaste"]
let itemsToReturn = commonGroceryBag.intersection(roommatesGroceryBag)

let yourSecondBag: Set = ["Berries", "Yoghurt"]
let roommatesSecondBag: Set = ["Grapes", "Honey"]
let disjoint = yourSecondBag.isDisjoint(with: roommatesSecondBag) // do not share any items

// Bronze Challenge
let myCities:Set = ["Atlanta", "Chicago", "Jacksonville", "New York", "San Francisco"]
let yourCities:Set = ["Chicago", "San Francisco", "Jacksonville"]
let commons = yourCities.isSubset(of: myCities)

// Silver Challenge
// Using formUnion and formIntersection
