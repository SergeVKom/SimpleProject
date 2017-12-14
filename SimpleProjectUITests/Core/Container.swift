//
//  Container.swift
//  Gaia
//
//  Created by Sergey Komarov on 5/6/17.
//  Copyright © 2017 Gaiam TV. All rights reserved.
//

import Foundation
import XCTest

struct Container {
    static var app: XCUIApplication = XCUIApplication()
    static var device: XCUIDevice = XCUIDevice.shared
}
