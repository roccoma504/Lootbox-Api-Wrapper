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
        case Name
        case Level
        case Rank
        case RankImg
        case LevelFrame
        case Star
        case QuickWins
        case QuickLost
        case QuickPlayed
        case QuickPlayTime
        case CompetitiveWins
        case CompetitiveLost
        case CompetitivePlayed
        case CompetitivePlaytime
        case Avatar
    }
    
    private var ID: String
    private var platform: PlatformType
    private var region: RegionType
    private var json: [String : AnyObject]!
    
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
        case .Name:
            return json["data"]!["username"] as! String
        case .Level:
            return String(json["data"]!["level"] as! Int)
        case .QuickWins:
            return json["data"]!["games"]!!["quick"]!!["wins"] as! String
        case .QuickLost:
            return String(json["data"]!["games"]!!["quick"]!!["lost"] as! Int)
        case .QuickPlayed:
            return json["data"]!["games"]!!["quick"]!!["played"] as! String
        case .QuickPlayTime:
            return json["data"]!["playtime"]!!["quick"] as! String
        case .CompetitiveWins:
            return json["data"]!["games"]!!["competitive"]!!["wins"] as! String
        case .CompetitiveLost:
            return String(json["data"]!["games"]!!["competitive"]!!["lost"] as! Int)
        case .CompetitivePlayed:
            return json["data"]!["games"]!!["competitive"]!!["played"] as! String
        case .CompetitivePlaytime:
            return json["data"]!["playtime"]!!["competitive"] as! String
        case .Avatar:
            return json["data"]!["avatar"] as! String
        case .Rank:
            return json["data"]!["competitive"]!!["rank"] as! String
        case .RankImg:
            return json["data"]!["competitive"]!!["rank_img"] as! String
        case .LevelFrame:
            return json["data"]!["levelFrame"] as! String
        case .Star:
            return json["data"]!["star"] as! String
        }
    }
    
}
