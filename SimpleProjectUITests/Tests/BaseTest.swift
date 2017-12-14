//
//  BaseTest.swift
//  Gaia
//
//  Created by Sergey Komarov on 4/19/17.
//  Copyright © 2017 Gaiam TV. All rights reserved.
//

import XCTest

class BaseTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = true
    }
    
    static func rotateScreenRandomly() {
        let orientations: Set<UIDeviceOrientation> = [.landscapeLeft, .landscapeRight, .portrait, .portraitUpsideDown]
        Container.device.orientation = orientations.randomObject()!
    }
    
    static func launchAppWithArguments(_ args: [String]) {
        Container.app.launchArguments.append(contentsOf: args)
        Container.app.launch()
    }
    
    static func launchAppWithoutReset() {
        Container.app.launchArguments.removeAll()
        Container.app.launch()
    }
    
    override class func tearDown() {
        Container.app.launchArguments.removeAll()
    }
}
