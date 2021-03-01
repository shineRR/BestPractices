//
//  FilmData.swift
//  PeoplePractice
//
//  Created by Ilya Baryko on 1.03.21.
//

import Foundation

struct FilmData: Decodable {
    let count: Int
    let all: [Film]
    
    enum CodingKeys: String, CodingKey {
        case count
        case all = "results"
    }
}

extension FilmData: NamebleStruct {
    var structName: String {
        "Films"
    }
    
    var pageCount: Int {
        all.count
    }
}
