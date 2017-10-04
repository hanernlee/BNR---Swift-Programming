//
//  Mayor.swift
//  MonsterTown
//
//  Created by Christopher Lee on 5/10/17.
//  Copyright © 2017 Christopher Lee. All rights reserved.
//

import Foundation

struct Mayor {
    private var anxietyLevel: Int = 0
    
    mutating func condolonces(forMonsterAttackType type: Town.AttackType) {
        if (type == Town.AttackType.zombie) {
            anxietyLevel += 1
            print("Current Anxiety Level \(anxietyLevel)")
        }
        print("I'm deeply saddened to hear about this latest tragedy. I promise that my office is looking into the nature of this rash of violence.")
    }

}
