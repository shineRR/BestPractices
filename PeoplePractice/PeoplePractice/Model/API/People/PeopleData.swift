//
//  PeopleData.swift
//  PeoplePractice
//
//  Created by Ilya Baryko on 1.03.21.
//

import Foundation

struct PeopleData: Decodable {
    var count: Int
    var next: String?
    var previous: String?
    var all: [Person]
    
    enum CodingKeys: String, CodingKey {
        case count = "count"
        case next = "next"
        case previous = "previous"
        case all = "results"
    }
}

extension PeopleData: NamebleStruct {
    var structName: String {
        return "People"
    }
    
    var pageCount: Int {
        return all.count
    }
}
