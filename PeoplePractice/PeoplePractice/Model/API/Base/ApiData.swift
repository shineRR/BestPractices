//
//  ApiData.swift
//  PeoplePractice
//
//  Created by Ilya Baryko on 2.03.21.
//

import Foundation
import ObjectMapper

enum ModelTypes: String, CaseIterable {
    case people = "people", starships = "starships", species = "species", films = "films", planets = "planets", vehicles = "vehicles", wrong = "wrong"
    
    static subscript(_ element: String) -> ModelTypes {
        for type in ModelTypes.allCases {
            if element.parse(element: type.rawValue) {
                return type
            }
        }
        return wrong
    }
}

class ApiData: BaseMappableModel  {
    
    var object: ModelTypes?
    var count: Int?
    var next: String?
    var previous: String?
    var currentPageCount: Int?
    
    static subscript(model: ApiData) -> ModelTypes {
        return ModelTypes.allCases.first(where: { $0 == model.object }) ?? .wrong
    }
    
    override func mapping(map: Map, items: Int) {
        object <- map["objectName"]
        count <- map["count"]
        next <- map["next"]
        previous <- map["previous"]
        self.currentPageCount = items
    }
}
