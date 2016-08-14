//
//  AllHeroes.swift
//  Lootbox-Api-Wrapper
//
//  Created by Matthew Rocco on 8/12/16.
//  Copyright © 2016 Matthew Rocco. All rights reserved.
//

import UIKit

class AllHeroes: NSObject {

    private var ID: String
    private var platform: PlatformType
    private var region: RegionType
    private var mode: ModeType
    private var json: [String : AnyObject]!

    enum ValueKind: String {
        case Cards = "Cards"
        case DamagaeDoneAverage = "DamageDone-Average"
        case DamageDone = "DamageDone"
        case DamageDoneMostInGame = "DamageDone-MostinGame"
        case Deaths = "Deaths"
        case DeathsAverage = "Deaths-Average"
        case DefensiveAssistsAverage = "DefensiveAssists-Average"
        case DefensiveAssistsMostInGame = "DefensiveAssists-MostinGame"
        case DefensiveAssistsTotal = "DefensiveAssists"
        case Eliminations = "Eliminations"
        case EliminationsAverage = "Eliminations-Average"
        case EliminationsMostInGame = "Eliminations-MostinGame"
        case EnvironmentalDeaths = "EnvironmentalDeaths"
        case EnvironmentalKills = "EnvironmentalKill"
        case FinalBlows = "FinalBlows"
        case FinalBlowsAverage = "FinalBlows-Average"
        case FinalBlowsMostInGame = "FinalBlows-MostinGame"
        case HealingDone = "HealingDone"
        case HealingDoneAverage = "HealingDone-Average"
        case HealingDoneMostInGame = "HealingDone-MostinGame"
        case MedalsBronze = "Medals-Bronze"
        case MedalsGold = "Medals-Gold"
        case MedalsSilver = "Medals-Silver"
        case MeleeFinalBlows = "MeleeFinalBlows"
        case MeleeFinalBlowsAverage = "MeleeFinalBlows-Average"
        case MeleeFinalBlowsMostInGame = "MeleeFinalBlow-MostinGame"
        case MultikillBest = "Multikill-Best"
        case MultiKills = "Multikills"
        case ObectiveKills = "ObjectiveKills"
        case ObjecetiveKillsAverage = "ObjectiveKills-Average"
        case ObjectiveKillsMostInGame = "ObjectiveKills-MostinGame"
        case ObjectiveTimeAverage = "ObjectiveTime-Average"
        case ObjectiveTimeMostInGame = "ObjectiveTime-MostinGame"
        case ObjectiveTive = "ObjectiveTime"
        case OffensiveAssistsAverage = "OffensiveAssists-Average"
        case OffensiveAssistsMostInGame = "OffensiveAssists-MostinGame"
        case OffensiveAssistsTotal = "OffensiveAssists"
        case Played = "GamesPlayed"
        case SoloKills = "SoloKills"
        case SolokillsAverage = "SoloKills-Average"
        case SoloKillsMostInGame = "SoloKills-MostinGame"
        case TimePlayed = "TimePlayed"
        case TimeSpentOnFileMostInGame = "TimeSpentonFire-MostinGame"
        case TimeSpentOnFireAverage = "TimeSpentonFire-Average"
        case TotalMedals = "Medals"
        case TotalTimeOnFire = "TimeSpentonFire"
        case Won = "GamesWon"
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
    init(ID: String,
         platform: PlatformType,
         region: RegionType,
         mode: ModeType,
         completion : (success: Bool, error: NSError?) -> ()) {
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
    func get(kind: ValueKind) -> String {
        return String(json[kind.rawValue])
    }

}
