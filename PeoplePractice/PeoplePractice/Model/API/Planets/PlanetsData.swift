//
//  PlanetsData.swift
//  PeoplePractice
//
//  Created by Ilya Baryko on 1.03.21.
//

import Foundation
import ObjectMapper

class PlanetsData: ApiData {
    var results: [Planet]?
    
    override func mapping(map: Map) {
        results <- map["results"]
        super.mapping(map: map, items: results?.count ?? 0)
    }
}
