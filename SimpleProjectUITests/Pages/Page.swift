//
//  Page.swift
//  Gaia
//
//  Created by Sergey Komarov on 5/31/17.
//  Copyright © 2017 Gaiam TV. All rights reserved.
//

import Foundation
import XCTest

class Page {
    
    lazy var loader = Container.app.images["Loader"]
    var isPageLoaded = false
        
    func waitForPageLoaded() -> Bool {
        return false
    }
    
    func relaunchApp<T: Page>(_ type: T.Type) -> T {
        Container.app.launchArguments.removeAll()
        Container.app.launch()
        return type.init()
    }
    
    required init() {
        isPageLoaded = waitForPageLoaded()
    }
    
    func isApplicationInBackground() -> Bool {
        return UIApplication.shared.applicationState == .background
    }
}
