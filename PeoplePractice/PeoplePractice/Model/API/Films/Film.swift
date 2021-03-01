//
//  Film.swift
//  PeoplePractice
//
//  Created by Ilya Baryko on 1.03.21.
//

import Foundation

struct Film: Decodable {
    let id: Int
    let title: String
    let openingCrawl: String
    let director: String
    let producer: String
    let releaseDate: String
    let starships: [String]
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case id = "episode_id"
        case title
        case openingCrawl = "opening_crawl"
        case director
        case producer
        case releaseDate = "release_date"
        case starships
        case url
    }
}

extension Film: Displayable {
    var name: String {
        title
    }
}
