//
//  SpeciesData.swift
//  PeoplePractice
//
//  Created by Ilya Baryko on 1.03.21.
//

import Foundation
import ObjectMapper

class SpeciesData: ApiData {
    
    var results: [Species]?
    
    override func mapping(map: Map) {
        results <- map["results"]
        super.mapping(map: map, items: results?.count ?? 0)
    }
}
