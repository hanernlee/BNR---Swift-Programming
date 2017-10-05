//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
var playgroundGreeting = str
playgroundGreeting += "! How are you today?"
str

class GreekGod {
    var name: String
    init(name: String) {
        self.name = name
    }
}

let hecate = GreekGod(name: "Hecate") //instance of a reference type
let anotherHecate = hecate // points to the same instance

// When you assign an instance of a class to a constant or variable, the constant or variable gets a reference to that instance of the class in memory
anotherHecate.name = "Another Hecate"
anotherHecate.name // refer to the same instance as hecate
hecate.name

// value type
struct Pantheon {
    var chiefGod: GreekGod
}

let pantheon = Pantheon(chiefGod: hecate) //instance of a value type

let zeus = GreekGod(name: "Zeus")
//pantheon.chiefGod = zeus | value types that are declared as constants are not mutable
zeus.name = "Zeus Jr."
zeus.name

pantheon.chiefGod.name
let greekPantheon = pantheon
hecate.name = "Trivia"
greekPantheon.chiefGod.name

let athena = GreekGod(name: "Athena")
let gods = [athena, hecate, zeus]

let godsCopy = gods
gods.last?.name = "Jupiter"
gods
godsCopy






