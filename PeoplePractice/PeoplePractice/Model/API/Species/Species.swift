//
//  Species.swift
//  PeoplePractice
//
//  Created by Ilya Baryko on 1.03.21.
//

import Foundation
import ObjectMapper

class Species: BaseModel {
    
    private let keys = ["name", "classification", "designation", "average_height", "hair_colors",
                        "skin_colors", "eye_colors", "average_lifespan", "language",
                        "homeworld", "people", "films", "created", "edited", "url"]
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

    override func mapping(map: Map) {
        super.mapping(map: map)
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
    }
    
    override func getProperties() -> [ModelProperty] {
        return ModelHelper.getProperties(keys: keys, dict: map)
    }
}
