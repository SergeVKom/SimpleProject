//
//  NavigationBar.swift
//  Gaia
//
//  Created by Sergey Komarov on 4/29/17.
//  Copyright © 2017 Gaiam TV. All rights reserved.
//

import XCTest

protocol NavigationBar {
    
    func waitForBarLoaded()
    func isNavigationBarAppears() -> Bool
    func goToHomePage<T: Page>(_ type: T.Type) -> T
    func goToAccountPage<T: Page>(_ type: T.Type) -> T
    
}

class Navigation: NavigationBar {
    
}

extension NavigationBar {
    
    private var bar:XCUIElement { return Container.app.tabBars.element(boundBy: 0) }
    var home:XCUIElement { return Container.app.tabBars.buttons.element(boundBy: 0) }
    var account:XCUIElement { return Container.app.tabBars.buttons.element(boundBy: 1) }
    
    func isNavigationBarAppears() -> Bool {
        return bar.isHittable
    }
    
    func waitForBarLoaded() {
        bar.waitUntilAppears(timeout: WaitFor.animation)
    }
    
    func goToHomePage<T: Page>(_ type: T.Type) -> T {
        XCTContext.runActivity(named: "Go to Home Page") { _ in
            home.tap()
        }
        return type.init()
    }
    
    func goToAccountPage<T: Page>(_ type: T.Type) -> T {
        XCTContext.runActivity(named: "Go to Account Page") { _ in
            account.tap()
        }
        return type.init()
    }
}
