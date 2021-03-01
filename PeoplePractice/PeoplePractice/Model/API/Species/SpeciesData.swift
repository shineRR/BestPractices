//
//  SpeciesData.swift
//  PeoplePractice
//
//  Created by Ilya Baryko on 1.03.21.
//

import Foundation

struct SpeciesData: Decodable {
    let count: Int
    let next: String?
    let previous: String?
    let all: [Species]
    
    enum CodingKeys: String, CodingKey {
        case count
        case next
        case previous
        case all = "results"
    }
}

extension SpeciesData: NamebleStruct {
    var structName: String {
        return "Species"
    }
    
    var pageCount: Int {
        return all.count
    }
}
