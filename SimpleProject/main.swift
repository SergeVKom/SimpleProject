//
//  main.swift
//  Gaia
//
//  Created by Sergey Komarov on 11/2/17.
//  Copyright © 2017 Gaiam TV. All rights reserved.
//

import Foundation
import UIKit

_ = autoreleasepool {
    
    if ProcessInfo().arguments.contains("--Autotests") {
        // Logic for running app for autotests
    }
    
    UIApplicationMain(
        CommandLine.argc,
        UnsafeMutableRawPointer(CommandLine.unsafeArgv).bindMemory(to:
            UnsafeMutablePointer<Int8>.self, capacity: Int(CommandLine.argc)),
        nil,
        NSStringFromClass(AppDelegate.self)
    )
}
