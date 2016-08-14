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
        case criticalHitAccuracy = "CriticalHitAccuracy"
        case criticalHits = "CriticalHits"
        case criticalHitsMostInGame = "CriticalHits-MostinGame"
        case criticalHitsMostInLife = "CriticalHits-MostinLife"
        case damageDone = "DamageDone"
        case damageDoneAverage = "DamageDone-Average"
        case damageDoneMostInGame = "DamageDone-MostinGame"
        case damageDoneMostInLife = "DamageDone-MostinLife"
        case deaths = "Deaths"
        case deathsAverage = "Deaths-Average"
        case eliminations = "Eliminations"
        case eliminationsAverage = "Eliminations-Average"
        case elminationsMostInGame = "Eliminations-MostinGame"
        case elminationsMostInLife = "Eliminations-MostinLife"
        case elminationsPerLife = "EliminationsperLife"
        case finalBlows = "FinalBlows"
        case finalBlowsAverage = "FinalBlows-Average"
        case finalBlowsMostInGame = "FinalBlows-MostinGame"
        case gamesPlayed = "GamesPlayed"
        case gamesWon = "GamesWon"
        case killStreakBest = "KillStreak-Best"
        case medalsBronze = "Medals-Bronze"
        case medalsSilver = "Medals-Silver"
        case objectiveKills = "ObjectiveKills"
        case objectiveKillsAverage = "ObjectiveKills-Average"
        case objectiveKillsMostInGame = "ObjectiveKills-MostinGame"
        case objectiveTime = "ObjectiveTime"
        case objectiveTimeAverage = "ObjectiveTime-Average"
        case objectiveTimeMostInGame = "ObjectiveTime-MostinGame"
        case soloKills = "SoloKills"
        case soloKillsAverage = "SoloKills-Average"
        case soloKillsMostInGame = "SoloKills-MostinGame"
        case timePlayed = "TimePlayed"
        case totalCards = "Card"
        case totalMedals = "Medals"
        case weaponAccuracy = "WeaponAccuracy"
        case winPercentage = "WinPercentage"
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
