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
    var walksWithLimp: Bool
    private(set) var isFallingApart: Bool
    
    init?(limp: Bool, fallingApart: Bool, town: Town?, monsterName: String) {
        walksWithLimp = limp
        isFallingApart = fallingApart
        // point's to superclass init
        super.init(town: town, monsterName: monsterName)
        
    }
    
    convenience init?(limp: Bool, fallingApart: Bool) {
        self.init(limp: limp, fallingApart: fallingApart, town: nil, monsterName: "Fred")
        if walksWithLimp {
            print("This zombie has a bad knee")
        }
    }
    
    deinit {
        print("Zombie named \(name) is no longer with ")
    }
    
    convenience required init?(town: Town?, monsterName: String) {
        self.init(limp: false, fallingApart: false, town: town, monsterName: monsterName)
    }
    
    var terrorPower = 10
    
    final override func terrorizeTown() {
        if let currentPopulation = town?.population {
            switch currentPopulation {
            case 0:
                print("No population to terrorize")
            case 1...terrorPower:
                town?.population = 0

            default:
                super.terrorizeTown()
                if !isFallingApart {
                    town?.changePopulation(by: -10)
                }
            }
        }
    }
}
