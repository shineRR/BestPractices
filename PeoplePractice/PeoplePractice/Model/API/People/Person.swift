//
//  Person.swift
//  PeoplePractice
//
//  Created by Ilya Baryko on 1.03.21.
//

import Foundation
import ObjectMapper

class Person: BaseModel {
    
    private let keys = ["name", "height", "mass", "hair_color",
                        "skin_color", "eye_color", "birth_year", "gender",
                        "homeworld", "films", "species", "vehicles",
                        "starships", "created", "edited", "url"]
    var height: String?
    var mass: String?
    var hairColor: String?
    var skinColor: String?
    var eyeColor: String?
    var birthYear: String?
    var gender: String?
    var homeworld: String?
    var films: [String]?
    var species: [String]?
    var vehicles: [String]?
    var starships: [String]?
    
    public override func mapping(map: Map) {
        super.mapping(map: map)
        height <- map["height"]
        mass <- map["mass"]
        hairColor <- map["hair_color"]
        skinColor <- map["skin_color"]
        eyeColor <- map["eye_color"]
        birthYear <- map["birth_year"]
        gender <- map["gender"]
        homeworld <- map["homeworld"]
        films <- map["films"]
        species <- map["species"]
        vehicles <- map["vehicles"]
        starships <- map["starships"]
    }
    
    override func getProperties() -> [ModelProperty] {
        return ModelHelper.getProperties(keys: keys, dict: map)
    }
}
