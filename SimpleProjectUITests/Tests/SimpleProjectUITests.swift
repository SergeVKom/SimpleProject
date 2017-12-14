//
//  SimpleProjectUITests.swift
//  SimpleProjectUITests
//
//  Created by Сергей Комаров on 11/15/17.
//  Copyright © 2017 Gaia. All rights reserved.
//

import XCTest

class SimpleProjectUITests: BaseTest {
    
    var accountPage: AccountPage!
        
    override func setUp() {
        super.setUp()
        BaseTest.launchAppWithArguments(["--Autotests"])
        accountPage = AccountPage()
    }
    
    func testUIExample() {
        XCTAssertEqual(accountPage
            .fillFields(user: TestData.user)
            .message.label, "\(TestData.user.name) has succesfully registered")
    }
}
