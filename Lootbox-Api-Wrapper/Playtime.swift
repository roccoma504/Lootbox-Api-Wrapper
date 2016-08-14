//
//  Playtime.swift
//  Lootbox-Api-Wrapper
//
//  Created by Matthew Rocco on 8/14/16.
//  Copyright © 2016 Matthew Rocco. All rights reserved.
//

import UIKit

class Playtime: NSObject {
    
    private var ID: String
    private var platform: PlatformType
    private var region: RegionType
    private var mode: ModeType
    private var hero: Heroes
    private var json: [String:AnyObject]!
    
    enum ValueKind: String {
        case Name = "name"
        case Playtime = "playtime"
        case Image = "image"
    }
    
    /**
     Initializes a User class and retrieves the data required. The completion
     block will return an error if the data could not be retrieved.
     
     - parameter ID:         The user ID
     - parameter platform:   The user platform
     - parameter region:     The user region
     - parameter mode:       The mode, quick or competitive
     - parameter completion: The completion block, will return error on
     failure
     
     - returns: Success : Denotes if the call was successful
     error : NSError returning an error condition, if any.
     */
    init(ID: String,
         platform: PlatformType,
         region: RegionType,
         mode: ModeType,
         hero: Heroes,
         completion: (success: Bool, error: NSError?) -> ()) {
        self.ID = ID
        self.platform = platform
        self.region = region
        self.mode = mode
        self.hero = hero
        
        super.init()
        
        print("retrieving")
        JSONUtilities.retrieve(URLUtilities.heroesURL(ID, platform: platform, region: region, mode: mode)) { (json, error) in
            print(error)
            print(json)
            if error != nil {
                completion(success: false, error: error)
            }
            else {
                if json["error"] != nil {
                    completion(success: false, error: NSError(domain: String(json["error"]), code: -1, userInfo: nil))
                }
                else {
                    self.json = json
                    completion(success: true, error: error)
                }
            }
        }
    }
    
    /**
     Returns the specifified value.
     
     - parameter kind: Possible value kinds
     
     - returns: A String representing the value in the JSON specified by
     the input parameter
     */
    func get(kind: ValueKind) -> String {
        return String(json[kind.rawValue])
    }


}
