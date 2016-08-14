//
//  Constants.swift
//  Lootbox API Wrapper
//
//  Created by Matthew Rocco on 8/9/16.
//  Copyright © 2016 Matthew Rocco. All rights reserved.
//

import UIKit

/// Defines the base URL
let BaseUrl = "https://api.lootbox.eu"

/**
 Defines the enumeration of possible game types
 
 - quick:
 - competitive:
 */
enum ModeType: String {
    case Quick = "quick-play"
    case Competitive = "competitive-play"
}

/**
 Defines the enumeration of possible platforms
 
 - psn: Playstation Network
 - xbl: Xbox Live
 - pc: Playstation
 */
enum PlatformType: String {
    case Psn = "psn"
    case Xbl = "xbl"
    case Pc = "pc"
}

/**
 Defines the enumertion of possible regions
 
 - eu:     Europe
 - us:     United States
 - kr:     Korea
 - cn:     Canada
 - global: Global
 */
enum RegionType: String {
    case Eu = "eu"
    case Us = "us"
    case Kr = "kr"
    case Cn = "cn"
    case Global = "global"
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
enum Heroes: String {
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
