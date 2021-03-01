//
//  Starship.swift
//  PeoplePractice
//
//  Created by Ilya Baryko on 1.03.21.
//

import Foundation

struct Starship: Decodable, Displayable {
    let name: String
    let model: String
    let manufacturer: String
    let cost: String
    let length: String
    let maxSpeed: String
    let crew: String
    let passengers: String
    let cargoCapacity: String
    let consumables: String
    let hyperdriveRating: String
    let MGLT: String
    let starshipClass: String
    let pilots: [String]
    let films: [String]
    let created: String
    let edited: String
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case model
        case manufacturer
        case cost = "cost_in_credits"
        case length
        case maxSpeed = "max_atmosphering_speed"
        case crew
        case passengers
        case cargoCapacity = "cargo_capacity"
        case consumables
        case hyperdriveRating = "hyperdrive_rating"
        case MGLT
        case starshipClass = "starship_class"
        case pilots
        case films
        case created
        case edited
        case url
    }
}
