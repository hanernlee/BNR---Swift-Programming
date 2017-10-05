//
//  main.swift
//  MonsterTown
//
//  Created by Christopher Lee on 5/10/17.
//  Copyright © 2017 Christopher Lee. All rights reserved.
//

import Foundation

//var myTown = Town()

//var myTown = Town(population: 10_000, numberOfStoplights: 6) //memberwise initializer
var myTown = Town(population: 0, stoplights: 6)

print(myTown?.printDescription())
let myTownSize = myTown?.townSize
print(myTownSize)

myTown?.changePopulation(by: 1_000_000)

print("Size \(myTown?.townSize); population: \(myTown?.population)")

var fredTheZombie: Zombie? = Zombie(limp: false, fallingApart: false, town: myTown, monsterName: "Fred")
fredTheZombie?.terrorizeTown()
fredTheZombie?.town?.printDescription()

var convinientZombie = Zombie(limp: true, fallingApart: false)

print("Victim pool: \(fredTheZombie?.victimPool)")
fredTheZombie?.victimPool = 500
print("Victim pool: \(fredTheZombie?.victimPool)")
print(Zombie.spookyNoise)
if Zombie.isTerrifying {
    print("Runaway")
}

fredTheZombie = nil
