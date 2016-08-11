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
    
    private var json : [String : AnyObject]!
    
    /**
     Initializes a User class and retrieves the data required. The completion
     block will return an error if the data could not be retrieved.
     
     - parameter ID:         The user ID
     - parameter platform:   The user platform
     - parameter region:     The user region
     - parameter completion: The completion block, will return error on
     failure
     
     - returns: Success : Denotes if the call was successful
     error : NSError returning an error condition, if any.
     */
    init(ID         : String,
         platform   : PlatformType,
         region     : RegionType,
         completion : (success : Bool, error: NSError?) -> ()) {
        self.ID = ID
        self.platform = platform
        self.region = region
        
        super.init()
        
        JSONUtilities.retrieve(URLUtilities.profileURL(ID, platform: platform, region: region)) { (json, error) in
            if error != nil {
                completion(success: false, error: error)
            }
            else {
                self.json = json
                completion(success: true, error: error)
            }
        }
    }
    
}
