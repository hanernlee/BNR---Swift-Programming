//: Playground - noun: a place where people can play

import UIKit

func printGreeting() {
    print("Hello World")
}

printGreeting()

func printPersonalGreeting(to name: String) {
    print("Hello \(name), welcome to your playground")
}

printPersonalGreeting(to: "Christopher")

func divisionDescriptionFor(numerator: Double, denominator: Double, withPunctuation punctuation: String = ".") -> String {
    return "\(numerator) divided by \(denominator) equals \(numerator / denominator)\(punctuation)"
}

divisionDescriptionFor(numerator: 9.0, denominator: 3.0)
print(divisionDescriptionFor(numerator: 9.0, denominator: 3.0, withPunctuation: "!"))

// Variadic Parameters take 0 or more input values for its arguments. Can only have one and should be the final parameter
func printVariadicPersonalGrettings(to names: String...) {
    for name in names {
        print("Hello \(name), welcome to playground")
    }
}

printVariadicPersonalGrettings(to: "Alex","Chris","Drew","Pat")

//In out parameters
var error = "The request Failed:"

//_ in front of a parameter name will suppress the external name when calling the function
func appendErrorCode(_ code: Int, toErrorString errorString: inout String) {
    if code == 400 {
        errorString += " bad request."
    }
}
appendErrorCode(400, toErrorString: &error)
error

// Nested function

func areaOfTriangle(base: Double, height: Double) -> Double {
    let numerator = base * height
    func divide () -> Double {
        return numerator / 2
    }
    return divide()
}

areaOfTriangle(base: 3.0, height: 5.0)

// Multiple returns
func sortEvenOddNumbers(_ numbers:[Int]) ->(evens: [Int], odds: [Int]) {
    var evens = [Int]()
    var odds = [Int]()
    
    for number in numbers {
        if number % 2 == 0 {
            evens.append(number)
        } else {
            odds.append(number)
        }
    }
    return (evens, odds)
}

let aBunchOfNumbers = [10,1,4,3,57,43,84,27,156,111]
let theSortedNumbers = sortEvenOddNumbers(aBunchOfNumbers)

print("The even numbers are \(theSortedNumbers.evens); the odd numbers are \(theSortedNumbers.odds)")

// Optional Return Types

func grabMiddleName(fromFullName name: (String, String?, String)) -> String? {
    return name.1
}

let middleName = grabMiddleName(fromFullName: ("Matt", "asd", "Matthias"))
if let theName = middleName {
    print("\(theName)")
}

// Exiting Early from a function
//func greetByMiddleName(fromFullName name: (first: String, middle: String?, last: String)) {
//    guard let middleName = name.middle else {
//        print("Hey There")
//        return
//    }
//    print("Hey \(middleName)")
//}
//
//greetByMiddleName(fromFullName: ("Matt", nil, "Matthias"))

// Bronze Challenge
func greetByMiddleName(fromFullName name: (first: String, middle: String?, last: String)) {
    guard let middleName = name.middle, middleName.characters.count < 4 else {
        print("Hey There")
        return
    }
    print("Hey \(middleName)")
}

greetByMiddleName(fromFullName: ("Matt", "Danger", "Matthias"))

// Silver Challenge
func siftBeans(fromGroceryList: [String]) -> (beans: [String], otherGroceries: [String]) {
    var beans = [String]()
    var otherGroceries = [String]()
    for item in fromGroceryList {
        if item.hasSuffix("beans") {
            beans.append(item)
        } else {
            otherGroceries.append(item)
        }
    }
    return (beans, otherGroceries)
}

let result = siftBeans(fromGroceryList: ["green beans", "milk", "black beans", "pinto beans", "apples"])

result.beans
result.otherGroceries







