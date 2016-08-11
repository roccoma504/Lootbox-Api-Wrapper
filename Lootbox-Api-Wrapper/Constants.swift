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
let SUPPORT_HEROES = ["Ana","Lucio","Mercy","Symmetra","Zenyatta"]

/**
 Defines the enumeration of possible game types
 
 - quick:
 - competitive:
 */
enum ModeType : String {
    case quick = "quick-play"
    case competitive = "competitive-play"
}

/**
 Defines the enumeration of possible platforms
 
 - psn: Playstation Network
 - xbl: Xbox Live
 - pc: Playstation
 */
enum PlatformType : String {
    case psn = "psn"
    case xbl = "xbl"
    case pc = "pc"
}

/**
 Defines the enumertion of possible regions
 
 - eu:     Europe
 - us:     United States
 - kr:     Korea
 - cn:     Canada
 - global: Global
 */
enum RegionType : String {
    case eu = "eu"
    case us = "us"
    case kr = "kr"
    case cn = "cn"
    case global = "global"
}


/**
 Defines the enumeration of possible heroes
 
 - Ana:
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
enum Heroes : String {
    case Ana = "Ana"
    case Bastion = "Bastion"
    case Dva = "Dva"
    case Genji = "Gengi"
    case Hanzo = "Hanzo"
    case Lucio = "Lucio"
    case Mccree = "Mccree"
    case Mei = "Mei"
    case Mercy = "Mercy"
    case Pharah = "Pharah"
    case Reaper = "Reaper"
    case Reinhardt = "Reinhardt"
    case Roadhog = "Roadhog"
    case Soldier76 = "Soldier76"
    case Symmetra = "Symmetra"
    case Torbjorn = "Torbjorn"
    case Tracer = "Tracer"
    case Widowmaker = "Widowmaker"
    case Winston = "Winston"
    case Zenyatta = "Zenyatta"
    case Zarya = "Zarya"
}



