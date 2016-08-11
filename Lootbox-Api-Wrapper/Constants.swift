//
//  Constants.swift
//  Lootbox API Wrapper
//
//  Created by Matthew Rocco on 8/9/16.
//  Copyright © 2016 Matthew Rocco. All rights reserved.
//

import UIKit

/// Defines the base URL
let BASE_URL = "https://api.lootbox.eu"

/// Defines the set of heroes broken down by type
let OFFENSE_HEROES = ["Genji","Mccree","Pharah","Reaper","Soldier 76","Tracer"]
let DEFENSE_HEROES = ["Bastion","Hanzo","Junkrat","Mei","Torbjorn","Widowmaker"]
let TANK_HEROES = ["D.Va","Reinhardt","Roadhog","Winston","Zarya"]
let SUPPORT_HEROES = ["Lucio","Mercy","Symmetra","Zenyatta"]

/**
 Defines the enumeration of possible heroes
 
 - Bastion:
 - Dva:
 - Genji:      
 - Hanzo:
 - Lucio:
 - Mccree:
 - Mei:
 - Mercy:
 - Pharah:
 - Reaper:
 - Reinhardt:
 - Roadhog:
 - Soldier76:
 - Symmetra:
 - Torbjorn:
 - Tracer:
 - Widowmaker:
 - Winston:
 - Zenyatta:
 - Zarya:
 */
enum Heroes {
    case Bastion
    case Dva
    case Genji
    case Hanzo
    case Lucio
    case Mccree
    case Mei
    case Mercy
    case Pharah
    case Reaper
    case Reinhardt
    case Roadhog
    case Soldier76
    case Symmetra
    case Torbjorn
    case Tracer
    case Widowmaker
    case Winston
    case Zenyatta
    case Zarya
}



