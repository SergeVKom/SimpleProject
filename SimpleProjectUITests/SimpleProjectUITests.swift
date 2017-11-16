//
//  SimpleProjectUITests.swift
//  SimpleProjectUITests
//
//  Created by Сергей Комаров on 11/15/17.
//  Copyright © 2017 Gaia. All rights reserved.
//

import XCTest

class SimpleProjectUITests: XCTestCase {
    
    let app = XCUIApplication()
        
    override func setUp() {
        super.setUp()
        continueAfterFailure = true
        app.launch()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testUIExample() {
        let name = app.textFields["userName"]
        let email = app.textFields["email"]
        name.tap()
        name.typeText("Serge")
        email.tap()
        email.typeText("sergey.komarov@oxagile.com")
        app.buttons["sendButton"].tap()
        XCTAssertEqual(app.staticTexts["message"].label, "Serge has succesfully registered")
    }
}
