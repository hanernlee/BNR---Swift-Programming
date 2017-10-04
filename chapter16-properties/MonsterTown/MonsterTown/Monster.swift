//
//  Monster.swift
//  MonsterTown
//
//  Created by Christopher Lee on 5/10/17.
//  Copyright © 2017 Christopher Lee. All rights reserved.
//

import Foundation

class Monster {
    static let isTerrifying = true
    class var spookyNoise: String {
        return "Grrr"
    }
    var town: Town?
    var name = "Monster"
    
    var victimPool: Int {
        get {
            return town?.population ?? 0
        }
        set(newVictimPool) {
            town?.population = newVictimPool
        }
    }
    
    func terrorizeTown() {
        if town != nil {
            print("\(name) is terrorising a town!")
        } else {
            print("\(name) hasn't found a town to terrorize yet")
        }
    }
}
