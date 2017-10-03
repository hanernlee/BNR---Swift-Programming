//: Playground - noun: a place where people can play

import UIKit

let numberOfStoplights:Int = 4

var population: Int
population = 5422

var unemployedPeople =  30
var levelOfUnemployment = Double(unemployedPeople) / Double(population)
// Convert Double to String with format of up to 2 decimal places
var percentageLevelOfUnemployment = String(format: "%.2f", levelOfUnemployment * 100)

let townName: String = "Knowhere"
let townDescription = "\(townName) has a population of \(population) and \(numberOfStoplights) number of stoplights and level of unemployment is at \(percentageLevelOfUnemployment)%."
print(townDescription)

