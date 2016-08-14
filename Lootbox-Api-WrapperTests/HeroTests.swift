//
//  HeroTests.swift
//  Lootbox-Api-Wrapper
//
//  Created by Matthew Rocco on 8/14/16.
//  Copyright © 2016 Matthew Rocco. All rights reserved.
//

import XCTest

@testable import Lootbox_Api_Wrapper

var heroSuccess : Hero!
var heroFail : Hero!

var ID = "roclobster504"
let platform = PlatformType.Psn
let region = RegionType.Us
let hero = Heroes.Hanzo
let mode = ModeType.Quick


class HeroTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        successfulCreate()
        failCreate()

    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func successfulCreate() {
        
        weak var exp = expectationWithDescription("\(#function)\(#line)")
        
        heroSuccess = Hero(ID: ID, platform: platform, region: region, mode: mode, hero: hero) { (success, error) in
            XCTAssertTrue(success)
            exp!.fulfill()
            XCTAssertNotNil(heroSuccess.get(.CriticalHitAccuracy))
            XCTAssertNotNil(heroSuccess.get(.CriticalHits))
            XCTAssertNotNil(heroSuccess.get(.CriticalHitsMostInGame))
            XCTAssertNotNil(heroSuccess.get(.CriticalHitsMostInLife))
            XCTAssertNotNil(heroSuccess.get(.DamageDone))
            XCTAssertNotNil(heroSuccess.get(.DamageDoneAverage))
            XCTAssertNotNil(heroSuccess.get(.DamageDoneMostInGame))
            XCTAssertNotNil(heroSuccess.get(.DamageDoneMostInLife))
            XCTAssertNotNil(heroSuccess.get(.Deaths))
            XCTAssertNotNil(heroSuccess.get(.Eliminations))
            XCTAssertNotNil(heroSuccess.get(.EliminationsAverage))
            XCTAssertNotNil(heroSuccess.get(.ElminationsMostInGame))
            XCTAssertNotNil(heroSuccess.get(.ElminationsMostInLife))
            XCTAssertNotNil(heroSuccess.get(.ElminationsPerLife))
            XCTAssertNotNil(heroSuccess.get(.FinalBlows))
            XCTAssertNotNil(heroSuccess.get(.FinalBlowsAverage))
            XCTAssertNotNil(heroSuccess.get(.FinalBlowsMostInGame))
            XCTAssertNotNil(heroSuccess.get(.GamesPlayed))
            XCTAssertNotNil(heroSuccess.get(.GamesWon))
            XCTAssertNotNil(heroSuccess.get(.KillStreakBest))
            XCTAssertNotNil(heroSuccess.get(.MedalsBronze))
            XCTAssertNotNil(heroSuccess.get(.MedalsSilver))
            XCTAssertNotNil(heroSuccess.get(.MedalsGold))
            XCTAssertNotNil(heroSuccess.get(.ObjectiveKills))
            XCTAssertNotNil(heroSuccess.get(.ObjectiveKillsAverage))
            XCTAssertNotNil(heroSuccess.get(.ObjectiveKillsMostInGame))
            XCTAssertNotNil(heroSuccess.get(.ObjectiveTimeAverage))
            XCTAssertNotNil(heroSuccess.get(.ObjectiveTimeMostInGame))
            XCTAssertNotNil(heroSuccess.get(.SoloKills))
            XCTAssertNotNil(heroSuccess.get(.SoloKillsAverage))
            XCTAssertNotNil(heroSuccess.get(.SoloKillsMostInGame))
            XCTAssertNotNil(heroSuccess.get(.TimePlayed))
            XCTAssertNotNil(heroSuccess.get(.TotalCards))
            XCTAssertNotNil(heroSuccess.get(.TotalMedals))
            XCTAssertNotNil(heroSuccess.get(.WeaponAccuracy))
            XCTAssertNotNil(heroSuccess.get(.WinPercentage))


        }
        
        waitForExpectationsWithTimeout(15, handler: nil)
        
    }
    
    func failCreate() {
        
        ID = "roclbster504"
        
        weak var exp = expectationWithDescription("\(#function)\(#line)")
        
        heroFail = Hero(ID: ID, platform: platform, region: region, mode: mode, hero: hero) { (success, error) in
            XCTAssertFalse(success)
            exp!.fulfill()
        }
        
        waitForExpectationsWithTimeout(10, handler: nil)
        
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}
