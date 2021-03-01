//
//  PlanetsData.swift
//  PeoplePractice
//
//  Created by Ilya Baryko on 1.03.21.
//

import Foundation

struct PlanetsData: Decodable {
    let count: Int
    let next: String?
    let previous: String?
    let all: [Planet]
    
    enum CodingKeys: String, CodingKey {
        case count
        case next
        case previous
        case all = "results"
    }
}

extension PlanetsData: NamableStruct {
    var structName: String {
        "Planets"
    }
    
    var pageCount: Int {
        all.count
    }
}
