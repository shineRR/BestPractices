//
//  Species.swift
//  PeoplePractice
//
//  Created by Ilya Baryko on 1.03.21.
//

import Foundation
import ObjectMapper

class Species: Mappable {
    
    var name: String?
    var currentPageCount: Int?
    var classification: String?
    var designation: String?
    var avgHeight: String?
    var skinColors: String?
    var hairColors: String?
    var eyeColors: String?
    var avgLifespan: String?
    var homeworld: String?
    var language: String?
    var people: [String]?
    var films: [String]?
    var created: String?
    var edited: String?
    var url: String?
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        name <- map["name"]
        classification <- map["classification"]
        designation <- map["designation"]
        avgHeight <- map["average_height"]
        skinColors <- map["skin_colors"]
        hairColors <- map["hair_colors"]
        eyeColors <- map["eye_colors"]
        avgLifespan <- map["average_lifespan"]
        homeworld <- map["homeworld"]
        language <- map["language"]
        people <- map["people"]
        films <- map["films"]
        created <- map["created"]
        edited <- map["edited"]
        url <- map["url"]
    }
}
