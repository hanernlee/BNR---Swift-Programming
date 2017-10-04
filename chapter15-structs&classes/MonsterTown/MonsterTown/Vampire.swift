//
//  Vampire.swift
//  MonsterTown
//
//  Created by Christopher Lee on 5/10/17.
//  Copyright © 2017 Christopher Lee. All rights reserved.
//

import Foundation

class Vampire: Monster {
    var vampsConverted = [Vampire]()
    
     final override func terrorizeTown() {
        if let currentPopulation = town?.population {
            switch currentPopulation {
            case 0:
                print("No population to terrorize")
            default:
                super.terrorizeTown()
                town?.changePopulation(by: -1)
                vampsConverted.append(Vampire())
                vampireCount()
            }
        }
    }
    
    func vampireCount() {
        print("There are \(vampsConverted.count) of type vampire in this town!")
    }
}
