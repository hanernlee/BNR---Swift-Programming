//: Playground - noun: a place where people can play

import UIKit

// Closures sorting
let volunteerCounts = [1,3,40,32,2,53,77,13]

let volunteerSorted = volunteerCounts.sorted { $0 < $1 }
volunteerSorted
//func makeGrandTown() -> (Int, Int) -> Int {
//    func buildRoads(byAddingLights lights: Int, toExistingLights existingLights:Int) -> Int {
//        return lights + existingLights
//    }
//    return buildRoads
//}

//var stoplights = 4
//let townPlanByAddingLightsToExistingLights = makeGrandTown()
//stoplights = townPlanByAddingLightsToExistingLights(4, stoplights)
//print("Knowhere has \(stoplights) stoplights.")

// Function as an arugment
func makeTownGrand(withBudget budget: Int, condition: (Int) -> Bool) -> ((Int, Int) -> Int)? {
    if condition(budget) {
        func buildRoads(byAddingLights lights: Int, toExistingLights existingLights:Int) -> Int {
            return lights + existingLights
        }
        return buildRoads
    } else {
        return nil
    }
}

func evaluate(budget: Int) -> Bool {
    return budget > 10_000
}

var stoplights = 4

if let townPlanByAddingLightsToExistingLights = makeTownGrand(withBudget: 1000, condition: evaluate) {
    stoplights = townPlanByAddingLightsToExistingLights(4, stoplights)
}
print("Knowhere has \(stoplights) stoplights.")

if let newTownPlanByAddingLightsToExistingLights = makeTownGrand(withBudget: 10_500, condition: evaluate) {
    stoplights = newTownPlanByAddingLightsToExistingLights(4, stoplights)
}
print("Knowhere has \(stoplights) stoplights.")

// Closure Capture Values
// returns a function that takes one arguemnt as integer and returns integer
func makePopulationTracker(forInitialPopulation population: Int) -> (Int) -> Int {
    var totalPopulation = population
    func populationTracker(growth: Int) -> Int {
        totalPopulation += growth
        return totalPopulation
    }
    return populationTracker
}

var currentPopulation = 5_422
let growBy = makePopulationTracker(forInitialPopulation: currentPopulation)
growBy(500)
growBy(500)
growBy(500)
currentPopulation = growBy(500)
print(currentPopulation)

// Closure are reference types
let anotherGrowBy = growBy
anotherGrowBy(500) // points to the same function to which growby points
print(currentPopulation) // current population does not change yet as it has not been assigned to currentpopulation here

var bigCityPopulation = 4_061_981
let bigCityGrowBy = makePopulationTracker(forInitialPopulation: bigCityPopulation)
bigCityPopulation = bigCityGrowBy(10_000)

// Functional Programming
let precintPopulations = [1244, 2021, 2157]
let projectedPopulations = precintPopulations.map {
    (population: Int) -> Int in
    return population * 2
}
projectedPopulations

let bigProjections = projectedPopulations.filter {
    (population:Int) -> Bool in
    return population > 4000
}
bigProjections

let totalProjections = projectedPopulations.reduce(0) {
    (accumulatedProjection: Int, precintProjection: Int) -> Int in
    return accumulatedProjection + precintProjection
}
totalProjections


// Bronze Challenge
let volunteerSortedz = volunteerCounts.sorted {$0 < $1}
print(volunteerSortedz)

// Bronze Challenge 2
let volunteerSorteds = volunteerCounts.sorted()

// Gold Challenge
let shortenedReduce = projectedPopulations.reduce(0, {$0 + $1})
print(shortenedReduce)















