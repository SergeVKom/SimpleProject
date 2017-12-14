//
//  APIService.swift
//  Gaia
//
//  Created by Sergey Komarov on 6/7/17.
//  Copyright © 2017 Gaiam TV. All rights reserved.
//

import XCTest
import RPAgentSwiftXCTest

class APIService: NSObject {
    
    var user: User!
    var httpClient: HTTPClient!
    var token: String?
    var language = "?language=\(Constants.LanguageCode.lowercased())"
    
    init(user: User) {
        super.init()
        self.user = user
        self.httpClient = HTTPClient()
        let predicate = NSPredicate(format: "token != nil")
        let expect = XCTestCase().expectation(for: predicate, evaluatedWith: self)
        authentication(user: user)
        XCTestCase().wait(for: [expect], timeout: 50.0)
    }
    
    func authentication(user: User) {
        var data = EndPoints.login
        data.parameters = [
            "username": user.name,
            "password": user.password,
            "device": Constants.currentDevice
        ]
        httpClient.doRequest(data: data) { (result: LoginData) in
            if let jwt = result.jwt {
                self.token = jwt
            } else {
                print("Unsuccessful authorization!")
            }
        }
    }
    
    func getSeriesFeaturedVideo(seriesId: Int) -> FeaturedVideo {
        var video = FeaturedVideo()
        var request = EndPoints.featuredVideo
        request.headers["Authorization"] = "Bearer \(self.token!)"
        request.url = "\(request.url)\(language)".replacingOccurrences(of: "$seriesId", with: String(seriesId))
        httpClient.doRequest(data: request) { result in
            video = result
        }
        let expect = XCTestCase().keyValueObservingExpectation(for: video!, keyPath: "seriesId")
        XCTWaiter().wait(for: [expect], timeout: 10)
        return video!
    }
}
