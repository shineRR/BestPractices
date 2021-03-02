//
//  ApiData.swift
//  PeoplePractice
//
//  Created by Ilya Baryko on 2.03.21.
//

import Foundation
import ObjectMapper

enum ModelTypes: String, CaseIterable {
    case people = "People", starships = "Starships", species = "Species", films = "Films", planets = "Planets", vehicles = "Vehicles"
}

class ApiData: Mappable  {
    var object: ModelTypes?
    var count: Int?
    var next: String?
    var previous: String?
    var currentPageCount: Int?
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    required init?(map: Map, currentPageCount: Int?) {
        self.currentPageCount = currentPageCount
    }
    
    func mapping(map: Map) {
        object <- map["objectName"]
        count <- map["count"]
        next <- map["next"]
        previous <- map["previous"]
    }
}
