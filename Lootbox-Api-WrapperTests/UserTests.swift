//
//  UserTests.swift
//  Lootbox-Api-Wrapper
//
//  Created by Matthew Rocco on 8/11/16.
//  Copyright © 2016 Matthew Rocco. All rights reserved.
//

import XCTest
@testable import Lootbox_Api_Wrapper

class UserTests: XCTestCase {
    
    var userSuccess : User!
    var userFail : User!

    var ID = "roclobster504"
    let platform = PlatformType.Psn
    let region = RegionType.Us
    
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
        
        userSuccess = User(ID: ID, platform: platform, region: region) { (success, error) in
            XCTAssertTrue(success)
            exp!.fulfill()
            XCTAssertNotNil(self.userSuccess.get(.Name))
            XCTAssertNotNil(self.userSuccess.get(.Level))
            XCTAssertNotNil(self.userSuccess.get(.Rank))
            XCTAssertNotNil(self.userSuccess.get(.RankImg))
            XCTAssertNotNil(self.userSuccess.get(.LevelFrame))
            XCTAssertNotNil(self.userSuccess.get(.Star))
            XCTAssertNotNil(self.userSuccess.get(.QuickWins))
            XCTAssertNotNil(self.userSuccess.get(.QuickLost))
            XCTAssertNotNil(self.userSuccess.get(.QuickPlayed))
            XCTAssertNotNil(self.userSuccess.get(.QuickPlayTime))
            XCTAssertNotNil(self.userSuccess.get(.CompetitiveWins))
            XCTAssertNotNil(self.userSuccess.get(.CompetitiveLost))
            XCTAssertNotNil(self.userSuccess.get(.CompetitivePlayed))
            XCTAssertNotNil(self.userSuccess.get(.CompetitivePlaytime))
            XCTAssertNotNil(self.userSuccess.get(.Avatar))
        }
        
        waitForExpectationsWithTimeout(15, handler: nil)
        
    }
    
    func failCreate() {
        
        ID = "roclbster504"
        
        weak var exp = expectationWithDescription("\(#function)\(#line)")
        
        userFail = User(ID: ID, platform: platform, region: region) { (success, error) in
           // XCTAssertFalse(success)

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
