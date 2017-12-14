//
//  ResponseObjects.swift
//  Gaia
//
//  Created by Sergey Komarov on 6/8/17.
//  Copyright © 2017 Gaiam TV. All rights reserved.
//

import Foundation
import ObjectMapper

struct LoginData: Mappable {
    var success: Bool?
    var uid: String?
    var jwt: String?
    var username: String?
    var email: String?
    
    init?(map: Map) { }
    
    mutating func mapping(map: Map) {
        success     <- map["success"]
        uid         <- map["uid"]
        jwt         <- map["jwt"]
        username    <- map["username"]
        email       <- map["email"]
    }
}

struct FeaturedVideo: Mappable {
    var seriesId: Int?
    var seriesTitle: String?
    var seasonCount: Int?
    var episodeCount: Int?
    var episode: Int?
    var season: Int?
    var title: String?
    var featuredType: String?
    
    init?(map: Map) { }
    
    init?() { }
    
    mutating func mapping(map: Map) {
        seriesId        <- map["seriesId"]
        seriesTitle     <- map["seriesTitle"]
        seasonCount     <- map["seasonCount"]
        episodeCount    <- map["episodeCount"]
        episode         <- map["episode"]
        season          <- map["season"]
        title           <- map["title"]
        featuredType    <- map["featuredType"]
    }
}
