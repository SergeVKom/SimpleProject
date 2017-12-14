//
//  TestData.swift
//  Gaia
//
//  Created by Sergey Komarov on 5/6/17.
//  Copyright © 2017 Gaiam TV. All rights reserved.
//

import Foundation

struct TestData {
    static let user: User = User(name: "Serge", email: "sergey.komarov@oxagile.com", password: "secret")
}

struct WaitFor {
    static let networkConnection: TimeInterval = 90
    static let animation: TimeInterval = 5
    static let controlsFade: UInt32 = 10
    static let scrollLimit: TimeInterval = 10
}

struct User {
    var name: String
    var email: String
    var password: String
}
