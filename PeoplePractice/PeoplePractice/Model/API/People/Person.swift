//
//  Person.swift
//  PeoplePractice
//
//  Created by Ilya Baryko on 1.03.21.
//

import Foundation

enum Gender: String {
    case male = "male", female = "female", other = ":D"
    
    static subscript(name: String) -> Gender {
        guard let gender = Gender(rawValue: name) else { return other }
            return gender
    }
}

struct Person: Decodable, Displayable {
    var name: String
    var height: String
    var mass: String
    var hairColor: String
    var skinColor: String
    var eyeColor: String
    var birthYear: String
    var gender: String
    var homeworld: String
    var films: [String]
    var species: [String]
    var vehicles: [String]
    var starships: [String]
    var created: String
    var edited: String
    var url: String
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case height = "height"
        case mass = "mass"
        case hairColor = "hair_color"
        case skinColor = "skin_color"
        case eyeColor = "eye_color"
        case birthYear = "birth_year"
        case gender = "gender"
        case homeworld = "homeworld"
        case films  = "films"
        case species  = "species"
        case vehicles  = "vehicles"
        case starships = "starships"
        case created = "created"
        case edited = "edited"
        case url = "url"
    }
}
