//: Playground - noun: a place where people can play

import UIKit

enum TextAlignment: Int {
    case left = 20
    case right = 30
    case center = 40
    case justify = 50
}

//var alignment: TextAlignment = TextAlignment.left
var alignment = TextAlignment.justify
//alignment = .right

//if alignment == .right {
//    print("We should right-align the text")
//}

print("Left value has raw value of \(TextAlignment.left.rawValue)")
print("Right value has raw value of \(TextAlignment.right.rawValue)")
print("Center value has raw value of \(TextAlignment.center.rawValue)")
print("Justify value has raw value of \(TextAlignment.justify.rawValue)")

// no need default
switch alignment {
    case .left:
        print("left aligned")
    case .right:
        print("right aligned")
    case .center:
        print("center aligned")
    case .justify:
        print("justify")
}

// Create raw value
let myRawValue = 100

// Succeeds cause the raw value of 20 exists in the enum
if let myAlignment = TextAlignment(rawValue: myRawValue) {
    print("successfully converted \(myRawValue) into a TextAlignment")
} else {
    print("\(myRawValue) has no corresponding TextAlignment case")
}

enum ProgrammingLanguages: String {
    case swift
    case objectivec = "objective-c"
    case c
    case cpp = "c++"
    case java
}

let myFavouriteProgrammingLanguage = ProgrammingLanguages.swift
print("My favourite programming language is \(myFavouriteProgrammingLanguage.rawValue)")

// Methods

enum Lightbulb {
    case on
    case off
    
    func surfaceTemperature(forAmbientTemperature ambient: Double) -> Double {
        switch self {
        case .on:
            return ambient + 150.0
        case .off:
            return ambient
        }
    }
    
    mutating func toggle() {
        switch self {
        case .on:
            self = .off
        case .off:
            self = .on
        }
    }
}

var bulb = Lightbulb.on
let ambientTemperature = 77.0

var bulbTemperature = bulb.surfaceTemperature(forAmbientTemperature: ambientTemperature)
print("the bulb's temperature is \(bulbTemperature)")

bulb.toggle()
bulbTemperature = bulb.surfaceTemperature(forAmbientTemperature: ambientTemperature)
print("the bulb's temperature is \(bulbTemperature)")

// Associated Values
enum ShapeDimensions {
    case point
    case square(side: Double)
    case rectangle(width: Double, height: Double)
    case rightTriangle(base: Double, height: Double, hypotenuse: Double)
    
    func area() -> Double {
        switch self  {
        case .point:
            return 0
        case let .square(side: side):
            return side * side
        case let .rectangle(width: w, height: h):
            return w * h
        case let .rightTriangle(base: b, height: h, hypotenuse: c):
            return 0.5 * b * h
        }
    }
    
    // Bronze Challenge
    func perimeter() -> Double {
        switch self {
        case .point:
            return 0
        case let .square(side: side):
            return side * 4
        case let .rectangle(width: w, height: h):
            return 2 * w + 2 * h
        case let .rightTriangle(base: b, height: h, hypotenuse: c):
            return b + h + c
        }
    }
}

var squareShape = ShapeDimensions.square(side: 10.0)
var rectShape = ShapeDimensions.rectangle(width: 5.0, height: 10.0)
var pointShape = ShapeDimensions.point

print("Square's area = \(squareShape.area())")
print("Rectangle area = \(rectShape.area())")
print("Point area = \(pointShape.area())")

// Recursive Enumerations

indirect enum FamilyTree {
    case noKnownParents
    case oneKnownParent(name: String, ancestors: FamilyTree)
    case twoKnownParents(fatherName: String, fatherAncestors: FamilyTree, motherName: String, motherAncestors: FamilyTree)
}

let fredAncestors = FamilyTree.twoKnownParents(fatherName: "Fred Sr.", fatherAncestors: .oneKnownParent(name: "Beth", ancestors: .noKnownParents), motherName: "Marsha", motherAncestors: .noKnownParents)


// Bronze Challenge
print("Square's perimeter = \(squareShape.perimeter())")
print("Rectangle perimeter = \(rectShape.perimeter())")
print("Point perimeter = \(pointShape.perimeter())")

// Silver Challenge
var triangleShape = ShapeDimensions.rightTriangle(base: 5.0, height: 10.0, hypotenuse: 12.0)
print("Triangle's area = \(triangleShape.area())")
print("Triangle's perimeter = \(triangleShape.perimeter())")











