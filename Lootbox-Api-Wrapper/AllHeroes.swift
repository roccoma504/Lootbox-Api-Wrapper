//
//  AllHeroes.swift
//  Lootbox-Api-Wrapper
//
//  Created by Matthew Rocco on 8/12/16.
//  Copyright © 2016 Matthew Rocco. All rights reserved.
//

import UIKit

class AllHeroes: NSObject {
    
    private var ID : String
    private var platform : PlatformType
    private var region : RegionType
    private var mode : ModeType
    private var json : [String : AnyObject]!
    
    enum ValueKind : String {
        case cards = "Cards"
        case damagaeDoneAverage = "DamageDone-Average"
        case damageDoe = "DamageDone"
        case damageDoneMostInGame = "DamageDone-MostinGame"
        case deaths = "Deaths"
        case deathsAverage = "Deaths-Average"
        case defensiveAssistsAverage = "DefensiveAssists-Average"
        case defensiveAssistsMostInGame = "DefensiveAssists-MostinGame"
        case defensiveAssistsTotal = "DefensiveAssists"
        case eliminations = "Eliminations"
        case eliminationsAverage = "Eliminations-Average"
        case eliminationsMostInGame = "Eliminations-MostinGame"
        case environmentalDeaths = "EnvironmentalDeaths"
        case environmentalKills = "EnvironmentalKill"
        case finalBlows = "FinalBlows"
        case finalBlowsAverage = "FinalBlows-Average"
        case finalBlowsMostInGame = "FinalBlows-MostinGame"
        case healingDone = "HealingDone"
        case healingDoneAverage = "HealingDone-Average"
        case healingDoneMostInGame = "HealingDone-MostinGame"
        case medalsBronze = "Medals-Bronze"
        case medalsGold = "Medals-Gold"
        case medalsSilver = "Medals-Silver"
        case meleeFinalBlows = "MeleeFinalBlows"
        case meleeFinalBlowsAverage = "MeleeFinalBlows-Average"
        case meleeFinalBlowsMostInGame = "MeleeFinalBlow-MostinGame"
        case multikillBest = "Multikill-Best"
        case multiKills = "Multikills"
        case obectiveKills = "ObjectiveKills"
        case objecetiveKillsAverage = "ObjectiveKills-Average"
        case objectiveKillsMostInGame = "ObjectiveKills-MostinGame"
        case objectiveTimeAverage = "ObjectiveTime-Average"
        case objectiveTimeMostInGame = "ObjectiveTime-MostinGame"
        case objectiveTive = "ObjectiveTime"
        case offensiveAssistsAverage = "OffensiveAssists-Average"
        case offensiveAssistsMostInGame = "OffensiveAssists-MostinGame"
        case offensiveAssistsTotal = "OffensiveAssists"
        case played = "GamesPlayed"
        case reconAssist = "ReconAssists"
        case soloKills = "SoloKills"
        case solokillsAverage = "SoloKills-Average"
        case soloKillsMostInGame = "SoloKills-MostinGame"
        case timePlayed = "TimePlayed"
        case timeSpentOnFileMostInGame = "TimeSpentonFire-MostinGame"
        case timeSpentOnFireAverage = "TimeSpentonFire-Average"
        case totalMedals = "Medals"
        case totalTimeOnFire = "TimeSpentonFire"
        case won = "GamesWon"
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
         completion : (success : Bool, error: NSError?) -> ()) {
        self.ID = ID
        self.platform = platform
        self.region = region
        self.mode = mode
        
        super.init()
        
        JSONUtilities.retrieve(URLUtilities.allHeroesURL(ID, platform: platform, region: region, mode: mode)) { (json, error) in
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
