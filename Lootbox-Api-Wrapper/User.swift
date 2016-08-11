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
    private var platform : PlatformType
    private var region : RegionType
    
    init(ID         : String,
         platform   : PlatformType,
         region     : RegionType,
         completion : (success : Bool, error: NSError?) -> ()) {
        self.ID = ID
        self.platform = platform
        self.region = region
    }
    
    
}
