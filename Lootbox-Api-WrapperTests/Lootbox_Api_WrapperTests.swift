//
//  Lootbox_Api_WrapperTests.swift
//  Lootbox-Api-WrapperTests
//
//  Created by Matthew Rocco on 8/11/16.
//  Copyright © 2016 Matthew Rocco. All rights reserved.
//

import XCTest
@testable import Lootbox_Api_Wrapper

class Lootbox_Api_WrapperTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func numberTests() {
        let one = "1"
        let ten = "10"
        let thousand = "1000"
        let tenthousand = "10000"
        let hundredhousand = "100000"
        let million = "1000000"
        let billion = "1000000000"
        
        XCTAssertEqual(one.addComma(), "1")
        XCTAssertEqual(ten.addComma(), "10")
        XCTAssertEqual(thousand.addComma(), "1,000")
        XCTAssertEqual(tenthousand.addComma(), "10,000")
        XCTAssertEqual(hundredhousand.addComma(), "100,000")
        XCTAssertEqual(million.addComma(), "1,000,000")
        XCTAssertEqual(billion.addComma(), "1,000,000,000")
    }
    
    
    func testPerformanceExample() {
        self.measureBlock {
        }
    }
    
}
