//
//  Planet.swift
//  PeoplePractice
//
//  Created by Ilya Baryko on 1.03.21.
//

import Foundation
import ObjectMapper

class Planet: BaseModel {
    
    private let keys = ["name", "rotation_period", "orbital_period", "diameter",
                        "climate", "gravity", "terrain", "surface_water",
                        "population", "residents", "films", "created", "edited", "url"]
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

    public override func mapping(map: Map) {
        super.mapping(map: map)
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
    }
    
    override func getProperties() -> [ModelProperty] {
        return ModelHelper.getProperties(keys: keys, dict: map)
    }
}
