//
//  URLUtilities.swift
//  Lootbox-Api-Wrapper
//
//  Created by Matthew Rocco on 8/11/16.
//  Copyright © 2016 Matthew Rocco. All rights reserved.
//

import XCTest
@testable import Lootbox_Api_Wrapper

class URLUtilitiesTest: XCTestCase {
    
    let userID = "roclobster504"
    let platform : PlatformType = .Psn
    let region : RegionType = .Us
    
    override func setUp() {
        super.setUp()
        achievementURL()
        profileURL()
        allHeroesURL()
        heroURL()
        heroesURL()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func achievementURL() {
        let rURL = String(URLUtilities.achievementsURL(userID, platform: platform, region: region))
        let compURL = "https://api.lootbox.eu/psn/us/roclobster504/achievements"
        XCTAssertTrue(rURL == compURL)
    }
    
    func profileURL() {
        var rURL = String(URLUtilities.profileURL(userID, platform: platform, region: region))
        var compURL = "https://api.lootbox.eu/psn/us/roclobster504/profile"
        XCTAssertTrue(rURL == compURL)
        
        rURL = String(URLUtilities.profileURL("Champ26", platform: .Xbl, region: region))
        compURL = "https://api.lootbox.eu/xbl/global/Champ26/profile"
        XCTAssertTrue(rURL == compURL)
    }
    
    func allHeroesURL() {
        var rURL = String(URLUtilities.allHeroesURL(userID, platform: platform, region: region,mode: .Competitive))
        var compURL = "https://api.lootbox.eu/psn/us/roclobster504/competitive-play/allHeroes"
        XCTAssertTrue(rURL == compURL)
        
        rURL = String(URLUtilities.allHeroesURL(userID, platform: platform, region: region,mode: .Quick))
        compURL = "https://api.lootbox.eu/psn/us/roclobster504/quick-play/allHeroes"
        XCTAssertTrue(rURL == compURL)
    }
    
    func heroURL() {
        var rURL = String(URLUtilities.heroURL(userID, platform: platform, region: region,mode: .Competitive, hero: .Hanzo))
        var compURL = "https://api.lootbox.eu/psn/us/roclobster504/competitive-play/Hanzo"
        XCTAssertTrue(rURL == compURL)
        
        rURL = String(URLUtilities.heroURL(userID, platform: platform, region: region, mode: .Quick, hero: .Hanzo))
        compURL = "https://api.lootbox.eu/psn/us/roclobster504/quick-play/Hanzo"
        XCTAssertTrue(rURL == compURL)
    }
    
    func heroesURL() {
        let rURL = String(URLUtilities.heroesURL(userID, platform: platform, region: region, mode: .Quick))
        let compURL = "https://api.lootbox.eu/psn/us/roclobster504/quick-play/heroes"
        XCTAssertTrue(rURL == compURL)

    }
    
    func testPerformanceExample() {
        self.measureBlock {
        }
    }
    
}
