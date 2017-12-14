//
//  EndPoints.swift
//  Gaia
//
//  Created by Sergey Komarov on 6/5/17.
//  Copyright © 2017 Gaiam TV. All rights reserved.
//

import RPAgentSwiftXCTest
import Alamofire

struct EndPoints {
    
    private static let baseURL = "https://d6api-stg-4b2c19.gaia.com"
    private static let coreapiURL = "https://coreapi-stage-7snd0k.gaia.com/v2"
    private static let brooklynURL = "https://brooklyn-stage-f7ydas.gaia.com/v2"
    private static var postHttpHeader = [
        "Content-Type": "application/x-www-form-urlencoded",
        "Accept": "application/json",
        "Accept-Encoding": "Accept-Encoding: gzip;q=1.0,compress;q=0.5",
        "Content-Length": "\(48)"
    ]
    static var getHttpHeader = [
        "Content-Type": "application/x-www-form-urlencoded",
        "Accept-Encoding": "Accept-Encoding: gzip;q=1.0,compress;q=0.5",
        "Accept": "application/json"
    ]
    static var login = EndPoint(
        headers: postHttpHeader,
        encoding: URLEncoding.httpBody,
        type: HTTPMethod.post,
        url: "\(baseURL)/s/login",
        keyPath:"",
        parameters: [:],
        returnedObject: LoginData.self
    )
    static var featuredVideo = EndPoint(
        headers: getHttpHeader,
        encoding: URLEncoding.default,
        type: HTTPMethod.get,
        url: "https://brooklyn-stage-f7ydas.gaia.com/v3/videos/series/$seriesId/featured",
        keyPath:"featuredVideo",
        parameters: [:],
        returnedObject: FeaturedVideo.self
    )
}
