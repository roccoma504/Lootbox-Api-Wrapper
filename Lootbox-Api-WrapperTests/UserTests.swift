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
    
    var user : User!
    
    override func setUp() {
        super.setUp()
        successfulCreate()
        
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func successfulCreate() {
        
        let ID = "roclobster504"
        let region : RegionType = .us
        let platform : PlatformType = .psn
        let exp = expectationWithDescription("\(#function)\(#line)")
        
        user = User(ID: ID, platform: platform, region: region) { (success, error) in
            XCTAssertTrue(success)
            exp.fulfill()

            print(self.user)
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
