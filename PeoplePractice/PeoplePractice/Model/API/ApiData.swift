//
//  ApiData.swift
//  PeoplePractice
//
//  Created by Ilya Baryko on 2.03.21.
//

import Foundation
import ObjectMapper

enum ModelTypes: String, CaseIterable {
    case people = "People",
         starships = "Starships",
         species = "Species",
         films = "Films",
         planets = "Planets",
         vehicles = "Vehicles",
         wrong = "wrong"
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
