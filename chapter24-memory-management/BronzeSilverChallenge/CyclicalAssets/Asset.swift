//
//  Asset.swift
//  CyclicalAssets
//
//  Created by Christopher Lee on 7/10/17.
//  Copyright © 2017 Christopher Lee. All rights reserved.
//

import Foundation

class Asset:CustomStringConvertible {
    let name: String
    let value: Double
    //weak reference does not increase the reference count
    weak var owner: Person?
    
    var description: String {
        if let actualOwner = owner {
            return "Asset(\(name)), worth \(value), owned by \(actualOwner)"
        } else {
            return "Asset(\(name), worth \(value), not owned by anyone"
        }
    }
    
    var assetIndex: Int

    init(name: String, value: Double) {
        self.name = name
        self.value = value
        self.assetIndex = 0
    }
    
    deinit {
        print("\(self) is being deallocated")
    }
}
