//
//  Planet.swift
//  PeoplePractice
//
//  Created by Ilya Baryko on 1.03.21.
//

import Foundation
import ObjectMapper

class Planet: Mappable {
    
    var name: String?
    var rotationPeriod: String?
    var orbitalPeriod: String?
    var diameter: String?
    var climate: String?
    var gravity: String?
    var terrain: String?
    var surfaceWater: String?
    var population: String?
    var residents: [String]?
    var films: [String]?
    var created: String?
    var edited: String?
    var url: String?
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        name <- map["name"]
        rotationPeriod <- map["rotation_period"]
        orbitalPeriod <- map["orbital_period"]
        diameter <- map["diameter"]
        climate <- map["climate"]
        gravity <- map["gravity"]
        terrain <- map["terrain"]
        surfaceWater <- map["surface_water"]
        population <- map["population"]
        residents <- map["residents"]
        films <- map["films"]
        created <- map["created"]
        edited <- map["edited"]
        url <- map["url"]
    }
}
