//
//  User.swift
//  Lootbox-Api-Wrapper
//
//  Created by Matthew Rocco on 8/11/16.
//  Copyright © 2016 Matthew Rocco. All rights reserved.
//

import UIKit

class User: NSObject {
    
    enum ValueKind : String {
        case name
        case level
        case rank
        case rankImg
        case levelFrame
        case star
        case quickWins
        case quickLost
        case quickPlayed
        case quickPlayTime
        case competitiveWins
        case competitiveLost
        case competitivePlayed
        case competitivePlaytime
        case avatar
        
    }
    
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
    
    /**
     Returns the specifified value.
     
     - parameter kind: Possible value kinds
     
     - returns: A String representing the value in the JSON specified by
     the input parameter
     */
    func get(kind : ValueKind) -> String {
        switch kind {
        case .name:
            return String(json["username"])
        case .level:
            return String(json["level"])
        case .quickWins:
            return String(json["quick"]!["wins"])
        case .quickLost:
            return String(json["quick"]!["lost"])
        case .quickPlayed:
            return String(json["quick"]!["played"])
        case .quickPlayTime:
            return String(json["playtime"]!["quick"])
        case .competitiveWins:
            return String(json["competitive"]!["wins"])
        case .competitiveLost:
            return String(json["competitive"]!["lost"])
        case .competitivePlayed:
            return String(json["competitive"]!["played"])
        case .competitivePlaytime:
            return String(json["playtime"]!["competitive"])
        case .avatar:
            return String(json["avatar"])
        case .rank:
            return String(json["competitive"]!["rank"])
        case .rankImg:
            return String(json["competitive"]!["rank_img"])
        case .levelFrame:
            return String(json["levelFrame"])
        case .star:
            return String(json["star"])
        }
    }
    
}
