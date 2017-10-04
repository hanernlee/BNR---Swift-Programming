//
//  main.swift
//  MonsterTown
//
//  Created by Christopher Lee on 5/10/17.
//  Copyright © 2017 Christopher Lee. All rights reserved.
//

import Foundation

var myTown = Town()
myTown.changePopulation(by: 500)

let fredTheZombie = Zombie()
fredTheZombie.town = myTown
fredTheZombie.terrorizeTown()
fredTheZombie.town?.printDescription()

let vampire = Vampire()
vampire.town = fredTheZombie.town
vampire.terrorizeTown()
vampire.town?.printDescription()
vampire.terrorizeTown()
vampire.town?.printDescription()
