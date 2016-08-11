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
                                 platform : String,
                                 region : String) -> NSURL {
        return NSURL(string :(BASE_URL)+"/"+(platform)+"/"+(fixXBL(platform, region: region))+"/"+(userID.replaceHash())+"/achievements")!
    }
    
    static func profileURL(userID : String,
                           platform : String,
                           region : String) -> NSURL {
        return NSURL(string : (BASE_URL)+"/"+(platform)+"/"+(fixXBL(platform, region: region))+"/"+(userID.replaceHash())+"/profile")!
    }
    
    static func quickPlayAllHeroesURL(userID : String,
                                      platform : String,
                                      region : String) -> NSURL {
        return NSURL(string : (BASE_URL)+"/"+(platform)+"/"+(fixXBL(platform, region: region))+"/"+(userID.replaceHash())+"/quick-play/allHeroes/")!
    }
    
    static func compPlayAllHeroesURL(platform : String,
                                     region : String,
                                     userID : String) -> NSURL {
        return NSURL(string :(BASE_URL)+"/"+(platform)+"/"+(fixXBL(platform, region: region))+"/"+(userID.replaceHash())+"/competitive-play/allHeroes/")!
    }
    
    static func quickHeroesURL(userID : String,
                               platform : String,
                               region : String,
                               hero : Heroes) -> NSURL {
        return NSURL(string :(BASE_URL)+"/"+(platform)+"/"+(fixXBL(platform, region: region))+"/"+(userID.replaceHash())+"/quick-play/hero"+"/"+hero.rawValue+"/")!
    }
    
    static func compHeroesURL(userID : String,
                              platform : String,
                              region : String,
                              hero : Heroes) -> NSURL {
        return NSURL(string :(BASE_URL)+"/"+(platform)+"/"+(fixXBL(platform, region: region))+"/"+(userID.replaceHash())+"/competitive-play/hero"+"/"+hero.rawValue+"/")!
    }
    
    static func allHerosURL(userID : String,
                            platform : String,
                            region : String) -> NSURL {
        return NSURL(string :(BASE_URL)+"/"+(platform)+"/"+(fixXBL(platform, region: region))+"/"+(userID.replaceHash())+"/heroes")!
    }
    
    
}

