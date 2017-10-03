//: Playground - noun: a place where people can play

import UIKit

// Multiple ways
var dict1: Dictionary<String, Double> = [:]
var dict2 = Dictionary<String, Double>()
var dict3: [String:Double] = [:]
var dict4 = [String:Double]()

var movieRatings = ["Donnie Darko" : 4, "Chungking Express" : 5, "Dark City" : 4]
print("I have rated \(movieRatings.count) movies")

let darkoRating = movieRatings["Donnie Darko"]
movieRatings["Dark City"] = 5
movieRatings

// updateValue forKey can return last value and new value
let oldRating: Int? = movieRatings.updateValue(5, forKey: "Donnie Darko")
if let lastRating = oldRating, let currentRating = movieRatings["Donnie Darko"] {
    print("Old Rating \(lastRating); current Rating \(currentRating)")
}

// Adding
movieRatings["The Cabinet of Dr. Caligari"] = 5

// Removing
//movieRatings.removeValue(forKey: "Dark City")
movieRatings["Dark City"] = nil

// Looping
for (key, value) in movieRatings {
    print("The movie \(key) was rated \(value)")
}

for movie in movieRatings.keys {
    print("User has rated \(movie)")
}

// Translating Dictionary to Array
let watchedMovies = Array(movieRatings.keys)


//Silver Challenge
var victoria = [
    "Melbourne" : [3000,3053,3051,3152,3050],
    "Geelong" : [2000,2001,2002,2003,2004]
]

for (key,value) in victoria {
    print("\(key) has the following postcodes: \(value)")
}

// Gold Challenge
// Copied from forums
var stateZipcodes = ["Calhoun":  ["12345", "23456", "34567", "45678", "56789"],
                     "Fayette":  ["12346", "23457", "34568", "45679", "56780"],
                     "Houghton": ["54321", "65432", "76543", "87654", "98765"]]
var output = "Georgia has the following zip codes: ["
let spaces = String(repeating: " ", count: output.characters.count)
print(output, terminator:"")

let countyArray = Array(stateZipcodes.keys)
for county in countyArray
{
    let countyZipcodes = stateZipcodes[county] ?? []
    for zipcode in countyZipcodes
    {
        print(zipcode, terminator:"")
        if (zipcode != countyZipcodes.last)
        {
            print(", ", terminator:"") // still more zip codes on this line
        }
        else if county != countyArray.last
        {
            print(",")                   // last zip code on this line but not the last line, so use normal line termination
            print(spaces, terminator:"") //  and indent the next line
        }
        else
        {
            print("]") // last zip code in last county, so we're done
        }
    }
}






