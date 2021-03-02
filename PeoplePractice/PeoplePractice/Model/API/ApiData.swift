//
//  ApiData.swift
//  PeoplePractice
//
//  Created by Ilya Baryko on 2.03.21.
//

import Foundation
import ObjectMapper

class ApiData: Mappable  {
    var objectName: String?
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
        objectName <- map["objectName"]
        count <- map["count"]
        next <- map["next"]
        previous <- map["previous"]
    }
}
