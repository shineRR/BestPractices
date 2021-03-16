//
//  Starship.swift
//  PeoplePractice
//
//  Created by Ilya Baryko on 1.03.21.
//

import Foundation
import ObjectMapper

class Starship: BaseVehicle {
    
    private let keys = ["name", "model", "manufacturer", "cost",
                        "length", "max_atmosphering_speed", "crew", "passengers",
                        "cargo_capacity", "consumables", "hyperdrive_rating", "MGLT",
                        "starship_class", "pilots", "films", "created", "edited", "url"]
    
    var hyperdriveRating: String?
    var MGLT: String?
    var starshipClass: String?
    
    public override func mapping(map: Map) {
        super.mapping(map: map)
        hyperdriveRating <- map["hyperdrive_rating"]
        MGLT <- map["MGLT"]
        starshipClass <- map["starship_class"]
    }
    
    override func getProperties() -> [ModelProperty] {
        return ModelHelper.getProperties(keys: keys, dict: map)
    }
}
