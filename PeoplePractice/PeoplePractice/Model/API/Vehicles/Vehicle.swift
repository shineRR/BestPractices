//
//  Vehicle.swift
//  PeoplePractice
//
//  Created by Ilya Baryko on 1.03.21.
//

import Foundation
import ObjectMapper

class Vehicle: BaseVehicle {
    
    private let keys = ["name", "model", "manufacturer", "cost",
                        "length", "max_atmosphering_speed", "crew", "passengers",
                        "cargo_capacity", "consumables", "vehicle_class", "pilots",
                        "films", "created", "edited", "url"]

    var vehicleClass: String?

    
    public override func mapping(map: Map) {
        super.mapping(map: map)
        vehicleClass <- map["vehicle_class"]
    }
    
    override func getProperties() -> [ModelProperty] {
        return ModelHelper.getProperties(keys: keys, dict: map)
    }
}
