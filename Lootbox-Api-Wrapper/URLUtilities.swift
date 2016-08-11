//
//  URLUtilities.swift
//  HeroWatch
//
//  Created by Matthew Rocco on 7/19/16.
//  Copyright © 2016 Matthew Rocco. All rights reserved.
//

import UIKit



class URLUtilities {
    
    /**
     Replaces the users region with global is platform is XBL.
     
     This is needed as a patch for the API
     
     - parameter platform: The users platform
     - parameter region:   The users region
     
     - returns: If XBL -> "global" else self
     */
    private static func fixXBL(platform : String, region : String) -> String {
        if platform == "xbl" {
            return "global"
        }
        else {
            return region
        }
    }
    
    static func achievementsURL (userID : String,
                                 platform : PlatformType,
                                 region : RegionType) -> NSURL {
        return NSURL(string :(BASE_URL)+"/"+(platform.rawValue)+"/"+(fixXBL(platform.rawValue, region: region.rawValue))+"/"+(userID.replaceHash())+"/achievements")!
    }
    
    static func profileURL(userID : String,
                           platform : PlatformType,
                           region : RegionType) -> NSURL {
        return NSURL(string : (BASE_URL)+"/"+(platform.rawValue)+"/"+(fixXBL(platform.rawValue, region: region.rawValue))+"/"+(userID.replaceHash())+"/profile")!
    }
    
    static func allHeroesURL(userID : String,
                            platform : PlatformType,
                             region : RegionType,
                             mode : ModeType) -> NSURL {
        return NSURL(string :(BASE_URL)+"/"+(platform.rawValue)+"/"+(fixXBL(platform.rawValue, region: region.rawValue))+"/"+(userID.replaceHash())+(mode.rawValue)+"/allHeroes/")!
    }
    
    static func quickHeroesURL(userID : String,
                               platform : PlatformType,
                               region : RegionType,
                               mode : ModeType,
                               hero : Heroes) -> NSURL {
        return NSURL(string :(BASE_URL)+"/"+(platform.rawValue)+"/"+(fixXBL(platform.rawValue, region: region.rawValue))+"/"+(userID.replaceHash())+(mode.rawValue)+"/"+hero.rawValue+"/")!
    }
    
    static func allHerosURL(userID : String,
                            platform : PlatformType,
                            region : RegionType) -> NSURL {
        return NSURL(string :(BASE_URL)+"/"+(platform.rawValue)+"/"+(fixXBL(platform.rawValue, region: region.rawValue))+"/"+(userID.replaceHash())+"/heroes")!
    }
    
    
}

