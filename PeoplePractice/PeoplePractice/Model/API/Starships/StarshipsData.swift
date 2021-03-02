//
//  StarshipsData.swift
//  PeoplePractice
//
//  Created by Ilya Baryko on 1.03.21.
//

import Foundation

struct StarshipsData: Decodable {
    let count: Int
    let next: String?
    let previous: String?
    let all: [Starship]
    
    enum CodingKeys: String, CodingKey {
        case count
        case next
        case previous
        case all = "results"
    }
}

extension StarshipsData: NamebleStruct {
    var structName: String {
        return "Starships"
    }
    
    var pageCount: Int {
        return all.count
    }
}
