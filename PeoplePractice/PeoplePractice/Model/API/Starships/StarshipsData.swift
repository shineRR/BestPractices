//
//  StarshipsData.swift
//  PeoplePractice
//
//  Created by Ilya Baryko on 1.03.21.
//

import Foundation
import ObjectMapper

class StarshipsData: ApiData {
    var results: [Starship]?
    
    override func mapping(map: Map) {
        results <- map["results"]
        super.mapping(map: map, items: results?.count ?? 0)
    }
}
