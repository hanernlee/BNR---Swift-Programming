//: Playground - noun: a place where people can play

import UIKit

// Conforming to Equatable & Comparable
// Comparable inherits from Equatable
struct Point: Comparable {
    let x: Int
    let y: Int
    
    // infix operator
    static func ==(lhs: Point, rhs: Point) -> Bool {
        return (lhs.x == rhs.x) && (lhs.y == rhs.y)
    }

    // Platinum Challenge
    var euclideanDistanceFromOrigin: Double {
        return sqrt(Double(x * x + y * y))
    }
    
    static func <(lhs: Point, rhs: Point) -> Bool {
        return lhs.euclideanDistanceFromOrigin < rhs.euclideanDistanceFromOrigin
    }
    
//    static func <(lhs: Point, rhs: Point) -> Bool {
//        return (lhs.x < rhs.x) && (lhs.y < rhs.y)
//    }
//
    // Bronze Challenge
    static func +(lhs: Point, rhs: Point) -> Point {
        return Point(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
    }
}

//let a = Point(x: 3, y: 4)
//let b = Point(x: 3, y: 4)
//let abEqual = (a == b)
//let abNotEqual = (a != b)

let c = Point(x: 2, y: 6)
let d = Point(x: 3, y: 7)
let cdEqual = (c == d)
let cdLessThan = (c < d)

let cLessThanEqualD = (c <= d)
let cGreaterThanD = (c > d)
let cGreatherThanEqualD = (c >= d)

// Silver Challenge
//class Person: Equatable {
//    let name: String
//    let age: Int
//
//    init(name: String, age:Int) {
//        self.name = name
//        self.age = age
//    }
//
//    static func ==(p1: Person, p2: Person) -> Bool {
//        return (p1.name == p2.name) && (p2.age == p1.age)
//    }
//}
//
//var p1 = Person(name: "George", age: 27)
//var p2 = Person(name: "Jamie", age: 28)
//
//var people = [p1, p2]
//
//var p1Index = people.index(of:p1)

class Person {
    var name: String
    weak var spouse: Person?
    
    init(name: String, spouse: Person?) {
        self.name = name
        self.spouse = spouse
    }
}

let matt = Person(name: "Matt", spouse: nil)
let drew = Person(name: "Drew", spouse: nil)

infix operator +++

func +++(lhs: Person, rhs: Person) {
    lhs.spouse = rhs
    rhs.spouse = lhs
}

matt +++ drew
matt.spouse?.name
drew.spouse?.name

