//
//  Person.swift
//  CyclicalAssets
//
//  Created by Christopher Lee on 7/10/17.
//  Copyright © 2017 Christopher Lee. All rights reserved.
//

import Foundation

class Person: CustomStringConvertible {
    let name: String
    let accountant = Accountant()
    var assets = [Asset]()
    
    var description: String {
        return "Person(\(name))"
    }
    
    init(name: String) {
        self.name = name
        
        accountant.netWorthChangedHandler = {
            // using capture list
            [weak self] netWorth in
            self?.netWorthDidChange(to: netWorth)
            return
        }
    }
    
    deinit {
        print("\(self) is being deallocated")
    }
    
    func takeOwnership(of asset: Asset) {
        if asset.owner == nil {
            accountant.gained(asset, completion: {
                asset.owner = self
                assets.append(asset)
                asset.assetIndex = assets.endIndex - 1
            })
        } else {
            print("Item is already owned by \(asset.owner?.name). Remove ownership before you reassign.")
        }
    }
    
    func removeOwnership(of asset: Asset) {
        accountant.lost(asset) {
            asset.owner = self
            assets.remove(at: asset.assetIndex - 1)
        }
    }
    
    func netWorthDidChange(to netWorth: Double) {
        print("The net worth of \(self) is now \(netWorth)")
    }
    
    func useNetWorthChangedHandler(handler: @escaping (Double) -> Void) {
        accountant.netWorthChangedHandler = handler
    }
}
