//
//  User.swift
//  Lootbox-Api-Wrapper
//
//  Created by Matthew Rocco on 8/11/16.
//  Copyright © 2016 Matthew Rocco. All rights reserved.
//

import UIKit

class User: NSObject {
    
    
    private var ID : String
    private var platform : String
    
    init(ID : String, platform : String) {
        self.ID = ID
        self.platform = platform
    }
    
    
}
