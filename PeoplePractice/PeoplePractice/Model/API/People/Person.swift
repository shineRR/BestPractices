//
//  Person.swift
//  PeoplePractice
//
//  Created by Ilya Baryko on 1.03.21.
//

import Foundation
import ObjectMapper

class Person: Mappable {
    var name: String?
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
    var created: String?
    var edited: String?
    var url: String?
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        name <- map["name"]
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
        created <- map["created"]
        edited <- map["edited"]
        url <- map["url"]
    }
}
