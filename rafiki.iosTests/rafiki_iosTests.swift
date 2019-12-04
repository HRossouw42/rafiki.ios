//
//  rafiki_iosTests.swift
//  rafiki.iosTests
//
//  Created by Harmun Rossouw on 2019/12/03.
//  Copyright © 2019 Harmun Rossouw. All rights reserved.
//

import XCTest
@testable import rafiki_ios

class rafiki_iosTests: XCTestCase {
    
    //MARK: User Class Tests
    func testUserInitializationSucceeds() {
        let guestUser = User.init(name: "guest", password: "123")
        XCTAssertNotNil(guestUser)
    }
    
    func testUserInitializationFails() {
        // Empty String for Name
        let emptyNameStringAccount = User.init(name: "", password: "123")
        XCTAssertNil(emptyNameStringAccount)
        
        //Empty String for Password
        let emptyPasswordStringAccount = User.init(name: "testname", password: "")
        XCTAssertNil(emptyPasswordStringAccount)
    }

//    override func setUp() {
//        // Put setup code here. This method is called before the invocation of each test method in the class.
//    }
//
//    override func tearDown() {
//        // Put teardown code here. This method is called after the invocation of each test method in the class.
//    }
//
//    func testExample() {
//        // This is an example of a functional test case.
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//    }
//
//    func testPerformanceExample() {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }

}
