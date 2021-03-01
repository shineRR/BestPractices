//
//  VehiclesData.swift
//  PeoplePractice
//
//  Created by Ilya Baryko on 1.03.21.
//

import Foundation

struct VehiclesData: Decodable {
    let count: Int
    let next: String?
    let previous: String?
    let all: [Vehicle]
    
    enum CodingKeys: String, CodingKey {
        case count
        case next
        case previous
        case all = "results"
    }
}

extension VehiclesData: NamebleStruct {
    var structName: String {
        return "Vehicles"
    }
    
    var pageCount: Int {
        return all.count
    }
    
    
}
