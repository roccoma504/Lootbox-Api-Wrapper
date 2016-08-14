//
//  Hero.swift
//  Lootbox-Api-Wrapper
//
//  Created by Matthew Rocco on 8/13/16.
//  Copyright © 2016 Matthew Rocco. All rights reserved.
//

import UIKit

class Hero: NSObject {
    
    private var ID : String
    private var platform : PlatformType
    private var region : RegionType
    private var mode : ModeType
    private var hero : Heroes
    private var json : [String : AnyObject]!
    
    enum ValueKind : String {
        case CriticalHitAccuracy = "CriticalHitAccuracy"
        case CriticalHits = "CriticalHits"
        case CriticalHitsMostInGame = "CriticalHits-MostinGame"
        case CriticalHitsMostInLife = "CriticalHits-MostinLife"
        case DamageDone = "DamageDone"
        case DamageDoneAverage = "DamageDone-Average"
        case DamageDoneMostInGame = "DamageDone-MostinGame"
        case DamageDoneMostInLife = "DamageDone-MostinLife"
        case Deaths = "Deaths"
        case CeathsAverage = "Deaths-Average"
        case Eliminations = "Eliminations"
        case EliminationsAverage = "Eliminations-Average"
        case ElminationsMostInGame = "Eliminations-MostinGame"
        case ElminationsMostInLife = "Eliminations-MostinLife"
        case ElminationsPerLife = "EliminationsperLife"
        case FinalBlows = "FinalBlows"
        case FinalBlowsAverage = "FinalBlows-Average"
        case FinalBlowsMostInGame = "FinalBlows-MostinGame"
        case GamesPlayed = "GamesPlayed"
        case GamesWon = "GamesWon"
        case KillStreakBest = "KillStreak-Best"
        case MedalsBronze = "Medals-Bronze"
        case MedalsSilver = "Medals-Silver"
        case MedalsGold = "Medals-Gold"
        case ObjectiveKills = "ObjectiveKills"
        case ObjectiveKillsAverage = "ObjectiveKills-Average"
        case ObjectiveKillsMostInGame = "ObjectiveKills-MostinGame"
        case ObjectiveTime = "ObjectiveTime"
        case ObjectiveTimeAverage = "ObjectiveTime-Average"
        case ObjectiveTimeMostInGame = "ObjectiveTime-MostinGame"
        case SoloKills = "SoloKills"
        case SoloKillsAverage = "SoloKills-Average"
        case SoloKillsMostInGame = "SoloKills-MostinGame"
        case TimePlayed = "TimePlayed"
        case TotalCards = "Card"
        case TotalMedals = "Medals"
        case WeaponAccuracy = "WeaponAccuracy"
        case WinPercentage = "WinPercentage"
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
    init(ID         : String,
         platform   : PlatformType,
         region     : RegionType,
         mode       : ModeType,
         hero       : Heroes,
         completion : (success : Bool, error: NSError?) -> ()) {
        self.ID = ID
        self.platform = platform
        self.region = region
        self.mode = mode
        self.hero = hero
        
        super.init()
        
        JSONUtilities.retrieve(URLUtilities.heroURL(ID, platform: platform, region: region, mode: mode, hero: hero)) { (json, error) in
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
    func get(kind : ValueKind) -> String {
        return String(json[kind.rawValue])
    }
    
}
