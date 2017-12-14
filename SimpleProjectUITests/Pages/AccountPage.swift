//
//  AccountPage.swift
//  Gaia
//
//  Created by Sergey Komarov on 4/29/17.
//  Copyright © 2017 Gaiam TV. All rights reserved.
//

import Foundation
import XCTest

class AccountPage: Page, NavigationBar {
    
    lazy var name = Container.app.textFields["userName"]
    lazy var email = Container.app.textFields["email"]
    lazy var button = Container.app.buttons["sendButton"]
    lazy var message = Container.app.staticTexts["message"]
    
    override func waitForPageLoaded() -> Bool {
        var result = false
        XCTContext.runActivity(named: "Waiting for Account Page loads") { _ in
            result = name.waitUntilAppears(timeout: WaitFor.networkConnection)
        }
        return result
    }
    
    func fillFields(user: User) -> AccountPage {
        name.clearAndTypeText(user.name)
        email.clearAndTypeText(user.email)
        button.tap()
        return AccountPage()
    }    
}
