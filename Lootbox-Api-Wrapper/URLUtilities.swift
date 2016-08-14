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
    private static func fixXBL(platform: String, region: String) -> String {
        if platform == "xbl" {
            return "global"
        }
        else {
            return region
        }
    }
    
    static func achievementsURL(userID: String,
                                platform: PlatformType,
                                region: RegionType) -> NSURL {
        return NSURL(string: (BaseUrl)+"/"+(platform.rawValue)+"/"+(fixXBL(platform.rawValue, region: region.rawValue))+"/"+(userID.replace("-", with:"-"))+"/achievements")!
    }
    
    static func profileURL(userID: String,
                           platform: PlatformType,
                           region: RegionType) -> NSURL {
        return NSURL(string: (BaseUrl)+"/"+(platform.rawValue)+"/"+(fixXBL(platform.rawValue, region: region.rawValue))+"/"+(userID.replace("-", with:"-"))+"/profile")!
    }
    
    static func allHeroesURL(userID: String,
                             platform: PlatformType,
                             region: RegionType,
                             mode: ModeType) -> NSURL {
        
        let modeString = mode.rawValue
        let regionString = region.rawValue
        let platformString = platform.rawValue
        
        return NSURL(string: (BaseUrl)+"/"+(platformString+"/")+(fixXBL(platformString, region: regionString)+"/")+(userID.replace("-", with:"-")+"/")+(modeString + "/")+"allHeroes")!
    }
    
    static func heroURL(userID: String,
                        platform: PlatformType,
                        region: RegionType,
                        mode: ModeType,
                        hero: Heroes) -> NSURL {
        
        let modeString = mode.rawValue
        let regionString = region.rawValue
        let platformString = platform.rawValue
        let heroString = hero.rawValue
                
        return NSURL(string: (BaseUrl)+"/"+(platformString+"/")+(fixXBL(platformString, region: regionString)+"/")+(userID.replace("-", with:"-")+"/")+(modeString + "/hero/")+heroString+"/")!
    }
    
    static func heroesURL(userID: String,
                          platform: PlatformType,
                          region: RegionType,
                          mode: ModeType) -> NSURL {
        return NSURL(string: (BaseUrl)+"/"+(platform.rawValue)+"/"+(fixXBL(platform.rawValue, region: region.rawValue))+"/"+(userID.replace("-", with:"-")+"/")+(mode.rawValue+"/")+"heroes")!
    }
    
}
