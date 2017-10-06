//: Playground - noun: a place where people can play

import UIKit

// Defines Velocity as an alternative type name for Double
typealias Velocity = Double
extension Velocity {
    var kph: Velocity { return self * 1.60934 }
    var mph: Velocity { return self }
}

protocol Vehicle {
    var topSpeed: Velocity { get }
    var numberOfDoors: Int { get }
    var hasFlatbed: Bool { get }
}

struct Car {
    let make: String
    let model: String
    let year: Int
    let numberOfDoors: Int
    let color: String
    let nickname: String
    var gasLevel: Double {
        willSet {
            precondition(newValue <= 1.0 && newValue >= 0.0, "New value must be between 0 and 1")
        }
    }
}

extension Car: Vehicle {
    var topSpeed: Velocity { return 180 }
    var hasFlatbed: Bool { return false }
}

extension Car {
    init(make: String, model: String, year: Int, numberOfDoors: Int) {
        self.init(
            make: make,
            model: model,
            year: year,
            numberOfDoors: numberOfDoors,
            color: "Black",
            nickname: "N/A",
            gasLevel: 1.0
        )
    }
}

var c = Car(make: "Ford", model: "Fusion", year: 2013, numberOfDoors: 2)

extension Car {
    enum Kind {
        case coupe, sedan
    }
    
    var kind: Kind {
        if numberOfDoors == 2 {
            return .coupe
        } else {
            return .sedan
        }
    }
}

c.kind

extension Car {
    mutating func emptyGas(by amount: Double) {
        precondition(amount <= 1 && amount > 0,
                     "Amount to remove must be between 0 and 1.")
        precondition(amount < gasLevel,
                     "Amount to remove is larger than the amount of gas left")
        gasLevel -= amount
    }
    
    mutating func fillGas() {
        gasLevel = 1.0
    }
}

c.emptyGas(by: 0.3)
c.gasLevel
//c.fillGas()
c.gasLevel

//Bronze Challenge

typealias timesFive = Int
extension timesFive {
    var timesFive: timesFive { return self * 5 }
}

5.timesFive




