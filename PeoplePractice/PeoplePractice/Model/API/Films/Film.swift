//
//  Film.swift
//  PeoplePractice
//
//  Created by Ilya Baryko on 1.03.21.
//

import Foundation
import ObjectMapper

class Film: Mappable {
    var id: Int?
    var title: String?
    var openingCrawl: String?
    var director: String?
    var producer: String?
    var releaseDate: String?
    var starships: [String]?
    var url: String?
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        id <- map["episode_id"]
        title <- map["title"]
        openingCrawl <- map["opening_crawl"]
        director <- map["director"]
        producer <- map["producer"]
        releaseDate <- map["release_date"]
        starships <- map["starships"]
        url <- map["url"]
    }
}
