//
//  main.swift
//  CyclicalAssets
//
//  Created by Christopher Lee on 7/10/17.
//  Copyright © 2017 Christopher Lee. All rights reserved.
//

import Foundation

var bob: Person? = Person(name: "Bob")
print("Created \(bob)")

var laptop: Asset? = Asset(name: "Shiny Laptop", value: 1_500.0)
var hat: Asset? = Asset(name: "Cowboy Hat", value: 175.0)
var backpack: Asset? = Asset(name: "Blue bagpack", value: 45.0)

bob?.useNetWorthChangedHandler { netWorth in
    print("Bob's net worth is now \(netWorth)")
}

bob?.takeOwnership(of: laptop!)
bob?.removeOwnership(of: laptop!) // removes asset and its reference
bob?.takeOwnership(of: hat!)

print("While Bob is alive, hat's owner is \(hat!.owner)")

bob = nil
print("bob variable is now \(bob)")
print("After Bob is deallocated, hat's owner is \(hat!.owner)")

laptop = nil
hat = nil
backpack = nil

