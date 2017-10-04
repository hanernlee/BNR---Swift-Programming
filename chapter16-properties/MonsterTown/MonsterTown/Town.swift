//
//  Town.swift
//  MonsterTown
//
//  Created by Christopher Lee on 5/10/17.
//  Copyright © 2017 Christopher Lee. All rights reserved.
//

import Foundation

struct Town {
    static let region = "South"
    var mayor = Mayor()
    var population = 5_422 {
        didSet(oldPopulation) {
            // Bronze Challenge
            if (population < oldPopulation) {
                print("The population has changed to \(population) from \(oldPopulation)")
                mayor.condolonces(forMonsterAttackType: attackType)
            }
        }
    }
    
    
    var numberOfStoplights = 4
    var attackType: AttackType = .monster

    enum Size {
        case small
        case medium
        case large
    }
    
    enum AttackType {
        case zombie
        case vampire
        case monster
    }
    
    //Using computed instead of lazy loading to keep track of size
    var townSize: Size {
        get {
            switch self.population {
            case 0...10_000:
                return Size.small
            case 10_001...100_000:
                return Size.medium
            default:
                return Size.large
            }
        }
    }
    
    func printDescription() {
        print("Population: \(population), number of stoplights: \(numberOfStoplights)")
    }
    
    // If instance method change any of structs properties
    mutating func changePopulation(by amount: Int) {
        population += amount
    }
}
