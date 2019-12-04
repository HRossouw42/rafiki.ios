//
//  rafiki_iosTests.swift
//  rafiki.iosTests
//
//  Created by Harmun Rossouw on 2019/12/03.
//  Copyright © 2019 Harmun Rossouw. All rights reserved.
//

@testable import rafiki_ios
import XCTest

class rafiki_iosTests: XCTestCase {
    // MARK: User Class Tests
    
    func testUserInitializationSucceeds() {
        let guestUser = User(name: "guest", password: "123")
        XCTAssertNotNil(guestUser)
    }
    
    func testUserInitializationFails() {
        // Empty String for Name
        let emptyNameStringUser = User(name: "", password: "123")
        XCTAssertNil(emptyNameStringUser)
        
        // Empty String for Password
        let emptyPasswordStringUser = User(name: "testname", password: "")
        XCTAssertNil(emptyPasswordStringUser)
    }
    
    // MARK: Account Class Tests
    
    func testAccountInitializationSucceeds() {
        let guestAccount = Account(name: "Test", balance: 99.999)
        XCTAssertNotNil(guestAccount)
        
        // Negative Balance
        let negativeBalanceAccount = Account(name: "NegativeTest", balance: -99.999)
        XCTAssertNotNil(negativeBalanceAccount)
        
        // Zero Balance
        let zeroBalanceAccount = Account(name: "ZeroTest", balance: 0)
        XCTAssertNotNil(zeroBalanceAccount)
    }
    
    func testAccountInitializationFails() {
        // Empty String for name
        let emptyNameStringAccount = Account(name: "", balance: 2000)
        XCTAssertNil(emptyNameStringAccount)
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
