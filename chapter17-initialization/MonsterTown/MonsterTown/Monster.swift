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
    var name: String
    
    var victimPool: Int {
        get {
            return town?.population ?? 0
        }
        set(newVictimPool) {
            town?.population = newVictimPool
        }
    }
    
    //argument for town matches property name on the class so have to use self
    required init?(town: Town?, monsterName: String) {
        guard monsterName != "" else {
            return nil
        }
        self.town = town
        name = monsterName
        
    }
    
    func terrorizeTown() {
        if town != nil {
            print("\(name) is terrorising a town!")
        } else {
            print("\(name) hasn't found a town to terrorize yet")
        }
    }
}
