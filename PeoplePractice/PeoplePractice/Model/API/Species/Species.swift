//
//  Species.swift
//  PeoplePractice
//
//  Created by Ilya Baryko on 1.03.21.
//

import Foundation

struct Species: Decodable, Displayable {
    var height: String = "0.0"
    
    let name: String
    let classification: String
    let designation: String
    let avgHeight: String
    let skinColors: String
    let hairColors: String
    let eyeColors: String
    let avgLifespan: String
    let homeworld: String
    let language: String
    let people: [String]
    let films: [String]
    let created: String
    let edited: String
    let url: String

    enum CodingKeys: String, CodingKey {
        case name
        case classification
        case designation
        case avgHeight = "average_height"
        case skinColors = "skin_colors"
        case hairColors = "hair_colors"
        case eyeColors = "eye_colors"
        case avgLifespan = "average_lifespan"
        case homeworld
        case language
        case people
        case films
        case created
        case edited
        case url
    }
}
