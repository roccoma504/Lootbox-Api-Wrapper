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
         region     : RegionType) {
        self.ID = ID
        self.platform = platform
        self.region = region
    }
    
    func fetch(completion : (success : Bool, error: NSError?) -> ()) {
        JSONUtilities.retrieve(URLUtilities.profileURL(ID, platform: platform, region: region)) { (json, error) in
            if error != nil {
                completion(success: false, error: error)
            }
            else {
                if json["error"] != nil {
                    completion(success: false, error: NSError(domain: String(json["error"]), code: -1, userInfo: nil))
                    
                }
                else {
                    print(json)
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
    func get(kind : ValueKind) -> String {
        switch kind {
        case .name:
            return json["data"]!["username"] as! String
        case .level:
            return String(json["data"]!["level"] as! Int)
        case .quickWins:
            return json["data"]!["games"]!!["quick"]!!["wins"] as! String
        case .quickLost:
            return String(json["data"]!["games"]!!["quick"]!!["lost"] as! Int)
        case .quickPlayed:
            return json["data"]!["games"]!!["quick"]!!["played"] as! String
        case .quickPlayTime:
            return json["data"]!["playtime"]!!["quick"] as! String
        case .competitiveWins:
            return json["data"]!["games"]!!["competitive"]!!["wins"] as! String
        case .competitiveLost:
            return String(json["data"]!["games"]!!["competitive"]!!["lost"] as! Int)
        case .competitivePlayed:
            return json["data"]!["games"]!!["competitive"]!!["played"] as! String
        case .competitivePlaytime:
            return json["data"]!["playtime"]!!["competitive"] as! String
        case .avatar:
            return json["data"]!["avatar"] as! String
        case .rank:
            return json["data"]!["competitive"]!!["rank"] as! String
        case .rankImg:
            return json["data"]!["competitive"]!!["rank_img"] as! String
        case .levelFrame:
            return json["data"]!["levelFrame"] as! String
        case .star:
            return json["data"]!["star"] as! String
        }
    }
    
}
