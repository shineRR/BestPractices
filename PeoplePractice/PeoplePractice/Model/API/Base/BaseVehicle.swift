//
//  VehiclesAndStarships.swift
//  PeoplePractice
//
//  Created by Ilya Baryko on 5.03.21.
//

import Foundation
import ObjectMapper

class BaseVehicle: BaseModel {
    
    var model: String?
    var manufacturer: String?
    var cost: String?
    var length: String?
    var maxSpeed: String?
    var crew: String?
    var passengers: String?
    var cargoCapacity: String?
    var consumables: String?
    var pilots: [String]?
    var films: [String]?
    
    override func mapping(map: Map) {
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
        pilots  <- map["pilots"]
        films  <- map["films"]
    }
}
