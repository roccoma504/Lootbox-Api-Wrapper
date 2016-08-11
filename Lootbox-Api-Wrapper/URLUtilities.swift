//
//  URLUtilities.swift
//  HeroWatch
//
//  Created by Matthew Rocco on 7/19/16.
//  Copyright © 2016 Matthew Rocco. All rights reserved.
//

import UIKit



class URLUtilities {
    
    
    private static func fixXBL(platform : String, region : String) -> String {
        if platform == "xbl" {
            return "global"
        }
        else {
            return region
        }
    }
    
    static func profileURL(platform : String, region : String, userID : String) -> NSURL {
        return NSURL(string : (BASE_URL)+"/"+(platform)+"/"+(fixXBL(platform, region: region))+"/"+(userID.replaceHash())+"/profile")!
    }
    
    static func allHero(platform : String, region : String, userID : String) -> NSURL {
        return NSURL(string :(BASE_URL)+"/"+(platform)+"/"+(fixXBL(platform, region: region))+"/"+(userID.replaceHash())+"/heroes")!
    }
    
    static func quickHeroesURL(platform : String, region : String, userID : String, hero : Heroes) -> NSURL {
        return NSURL(string :(BASE_URL)+"/"+(platform)+"/"+(fixXBL(platform, region: region))+"/"+(userID.replaceHash())+"/quick-play/hero"+"/"+String(hero).replaceHeroes()+"/")!
    }
    
    static func compHeroesURL(platform : String, region : String, userID : String, hero : Heroes) -> NSURL {
        return NSURL(string :(BASE_URL)+"/"+(platform)+"/"+(fixXBL(platform, region: region))+"/"+(userID.replaceHash())+"/competitive-play/hero"+"/"+String(hero).replaceHeroes()+"/")!
    }
    
    static func quickPlayURL(platform : String, region : String, userID : String) -> NSURL {
        return NSURL(string : (BASE_URL)+"/"+(platform)+"/"+(fixXBL(platform, region: region))+"/"+(userID.replaceHash())+"/quick-play/allHeroes/")!
    }
    
    static func compPlayURL(platform : String, region : String, userID : String) -> NSURL {
        return NSURL(string :(BASE_URL)+"/"+(platform)+"/"+(fixXBL(platform, region: region))+"/"+(userID.replaceHash())+"/competitive-play/allHeroes/")!
    }
    
}

