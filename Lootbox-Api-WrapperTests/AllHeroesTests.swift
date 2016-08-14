//
//  AllHeroesTests.swift
//  Lootbox-Api-Wrapper
//
//  Created by Matthew Rocco on 8/14/16.
//  Copyright © 2016 Matthew Rocco. All rights reserved.
//

import XCTest
@testable import Lootbox_Api_Wrapper

class AllHeroesTests: XCTestCase {
    
    var allHeroSuccess : AllHeroes!
    var allHeroFail : AllHeroes!
    
    var ID = "roclobster504"
    let platform = PlatformType.Psn
    let region = RegionType.Us
    let hero = Heroes.Hanzo
    let mode = ModeType.Quick
    
    override func setUp() {
        super.setUp()
        successfulCreate()
        failCreate()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func successfulCreate() {
        
        weak var exp = expectationWithDescription("\(#function)\(#line)")
        
        allHeroSuccess = AllHeroes(ID: ID, platform: platform, region: region, mode: mode) { (success, error) in
            XCTAssertTrue(success)
            exp!.fulfill()
            XCTAssertNotNil(self.allHeroSuccess.get(.Cards))
            XCTAssertNotNil(self.allHeroSuccess.get(.DamageDoneAverage))
            XCTAssertNotNil(self.allHeroSuccess.get(.DamageDone))
            XCTAssertNotNil(self.allHeroSuccess.get(.DamageDoneMostInGame))
            XCTAssertNotNil(self.allHeroSuccess.get(.Deaths))
            XCTAssertNotNil(self.allHeroSuccess.get(.DeathsAverage))
            XCTAssertNotNil(self.allHeroSuccess.get(.DefensiveAssistsAverage))
            XCTAssertNotNil(self.allHeroSuccess.get(.DefensiveAssistsMostInGame))
            XCTAssertNotNil(self.allHeroSuccess.get(.DefensiveAssistsTotal))
            XCTAssertNotNil(self.allHeroSuccess.get(.Eliminations))
            XCTAssertNotNil(self.allHeroSuccess.get(.EliminationsAverage))
            XCTAssertNotNil(self.allHeroSuccess.get(.EliminationsMostInGame))
            XCTAssertNotNil(self.allHeroSuccess.get(.EnvironmentalDeaths))
            XCTAssertNotNil(self.allHeroSuccess.get(.EnvironmentalKills))
            XCTAssertNotNil(self.allHeroSuccess.get(.FinalBlows))
            XCTAssertNotNil(self.allHeroSuccess.get(.FinalBlowsAverage))
            XCTAssertNotNil(self.allHeroSuccess.get(.FinalBlowsMostInGame))
            XCTAssertNotNil(self.allHeroSuccess.get(.HealingDone))
            XCTAssertNotNil(self.allHeroSuccess.get(.HealingDoneAverage))
            XCTAssertNotNil(self.allHeroSuccess.get(.HealingDoneMostInGame))
            XCTAssertNotNil(self.allHeroSuccess.get(.MedalsBronze))
            XCTAssertNotNil(self.allHeroSuccess.get(.MedalsGold))
            XCTAssertNotNil(self.allHeroSuccess.get(.MedalsSilver))
            XCTAssertNotNil(self.allHeroSuccess.get(.MeleeFinalBlows))
            XCTAssertNotNil(self.allHeroSuccess.get(.MeleeFinalBlowsAverage))
            XCTAssertNotNil(self.allHeroSuccess.get(.MeleeFinalBlowsMostInGame))
            XCTAssertNotNil(self.allHeroSuccess.get(.MultikillBest))
            XCTAssertNotNil(self.allHeroSuccess.get(.MultiKills))
            XCTAssertNotNil(self.allHeroSuccess.get(.ObectiveKills))
            XCTAssertNotNil(self.allHeroSuccess.get(.ObjecetiveKillsAverage))
            XCTAssertNotNil(self.allHeroSuccess.get(.ObjectiveKillsMostInGame))
            XCTAssertNotNil(self.allHeroSuccess.get(.ObjectiveTimeAverage))
            XCTAssertNotNil(self.allHeroSuccess.get(.ObjectiveTive))
            XCTAssertNotNil(self.allHeroSuccess.get(.OffensiveAssistsAverage))
            XCTAssertNotNil(self.allHeroSuccess.get(.OffensiveAssistsMostInGame))
            XCTAssertNotNil(self.allHeroSuccess.get(.OffensiveAssistsTotal))
            XCTAssertNotNil(self.allHeroSuccess.get(.Played))
            XCTAssertNotNil(self.allHeroSuccess.get(.SoloKills))
            XCTAssertNotNil(self.allHeroSuccess.get(.SolokillsAverage))
            XCTAssertNotNil(self.allHeroSuccess.get(.SoloKillsMostInGame))
            XCTAssertNotNil(self.allHeroSuccess.get(.TimePlayed))
            XCTAssertNotNil(self.allHeroSuccess.get(.TimeSpentOnFileMostInGame))
            XCTAssertNotNil(self.allHeroSuccess.get(.TimeSpentOnFireAverage))
            XCTAssertNotNil(self.allHeroSuccess.get(.TotalMedals))
            XCTAssertNotNil(self.allHeroSuccess.get(.TotalTimeOnFire))
            XCTAssertNotNil(self.allHeroSuccess.get(.Won))
        }
        
        waitForExpectationsWithTimeout(15, handler: nil)
        
    }
    
    func failCreate() {
        
        ID = "roclbster504"
        
        weak var exp = expectationWithDescription("\(#function)\(#line)")
        
        allHeroFail = AllHeroes(ID: ID, platform: platform, region: region,mode: mode) { (success, error) in
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
