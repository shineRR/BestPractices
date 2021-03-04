//
//  Starship.swift
//  PeoplePractice
//
//  Created by Ilya Baryko on 1.03.21.
//

import Foundation
import ObjectMapper

class Starship: BaseModel {
    
    private let keys = ["name", "model", "manufacturer", "cost",
                        "length", "max_atmosphering_speed", "crew", "passengers",
                        "cargo_capacity", "consumables", "hyperdrive_rating", "MGLT",
                        "starship_class", "pilots", "films", "created", "edited", "url"]
    var model: String?
    var manufacturer: String?
    var cost: String?
    var length: String?
    var maxSpeed: String?
    var crew: String?
    var passengers: String?
    var cargoCapacity: String?
    var consumables: String?
    var hyperdriveRating: String?
    var MGLT: String?
    var starshipClass: String?
    var pilots: [String]?
    var films: [String]?
    
    public override  func mapping(map: Map) {
        super.mapping(map: map)
        model <- map["model"]
        manufacturer <- map["manufacturer"]
        cost <- map["cost"]
        length <- map["length"]
        maxSpeed <- map["max_atmosphering_speed"]
        crew <- map["crew"]
        passengers <- map["passengers"]
        cargoCapacity <- map["cargo_capacity"]
        consumables <- map["consumables"]
        hyperdriveRating <- map["hyperdrive_rating"]
        MGLT <- map["MGLT"]
        starshipClass <- map["starship_class"]
        pilots  <- map["pilots"]
        films  <- map["films"]
    }
    
    override func getProperties() -> [ModelProperty] {
        return ModelHelper.getProperties(keys: keys, dict: map)
    }
}
