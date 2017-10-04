//
//  Zombie.swift
//  MonsterTown
//
//  Created by Christopher Lee on 5/10/17.
//  Copyright © 2017 Christopher Lee. All rights reserved.
//

import Foundation

class Zombie: Monster {
    override class var spookyNoise: String {
        return "Brains"
    }
    var walksWithLimp = true
    private(set) var isFallingApart = false
    
    var terrorPower = 10
    
    final override func terrorizeTown() {
        if let currentPopulation = town?.population {
            switch currentPopulation {
            case 0:
                print("No population to terrorize")
            case 1...terrorPower:
                town?.population = 0
                town?.attackType = .zombie

            default:
                super.terrorizeTown()
                if !isFallingApart {
                    town?.changePopulation(by: -10)
                    town?.attackType = .zombie
                }
            }
        }
    }
}
