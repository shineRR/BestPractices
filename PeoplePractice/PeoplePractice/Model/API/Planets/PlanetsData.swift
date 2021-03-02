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
    
    required init?(map: Map) {
        results <- map["results"]
        super.init(map: map, currentPageCount: results?.count)
    }
    
    required init?(map: Map, currentPageCount: Int?) {
        fatalError("init(map:currentPageCount:) has not been implemented")
    }
}
