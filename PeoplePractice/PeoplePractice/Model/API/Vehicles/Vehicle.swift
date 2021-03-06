//
//  Vehicle.swift
//  PeoplePractice
//
//  Created by Ilya Baryko on 1.03.21.
//

import Foundation
import ObjectMapper

class Vehicle: BaseMappableModel {
    
    var name: String?
    var model: String?
    var manufacturer: String?
    var cost: String?
    var length: String?
    var maxSpeed: String?
    var crew: String?
    var passengers: String?
    var cargoCapacity: String?
    var consumables: String?
    var vehicleClass: String?
    var pilots: [String]?
    var films: [String]?
    var created: String?
    var edited: String?
    var url: String?
    
    public override func mapping(map: Map) {
        name <- map["name"]
        model <- map["model"]
        manufacturer <- map["manufacturer"]
        cost <- map["cost"]
        length <- map["length"]
        maxSpeed <- map["max_atmosphering_speed"]
        crew <- map["crew"]
        passengers <- map["passengers"]
        cargoCapacity <- map["cargo_capacity"]
        consumables <- map["consumables"]
        vehicleClass <- map["vehicle_class"]
        pilots  <- map["pilots"]
        films  <- map["films"]
        created <- map["created"]
        edited <- map["edited"]
        url <- map["url"]
    }
}
