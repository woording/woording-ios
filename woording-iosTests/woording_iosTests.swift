//
//  woording_iosTests.swift
//  woording-iosTests
//
//  Created by Cor Pruijs on 09-01-16.
//  Copyright © 2016 Woording. All rights reserved.
//

import XCTest
@testable import woording_ios

class woording_iosTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testTokenRetrieval() {
        WoordingService.getToken {
            token in
            XCTAssert(token != nil)
        }
    }
    
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}
