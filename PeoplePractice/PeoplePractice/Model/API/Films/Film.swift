//
//  Film.swift
//  PeoplePractice
//
//  Created by Ilya Baryko on 1.03.21.
//

import Foundation
import ObjectMapper

class Film: BaseModel {
    
    private let keys = ["title", "episode_id", "opening_crawl", "director",
                        "producer", "release_date", "characters", "planets",
                        "starships", "vehicles", "species", "created", "edited",
                        "url"]
    var id: Int?
    var title: String?
    var openingCrawl: String?
    var director: String?
    var producer: String?
    var releaseDate: String?
    var starships: [String]?
    
    public override func mapping(map: Map) {
        super.mapping(map: map)
        id <- map["episode_id"]
        title <- map["title"]
        name = title
        openingCrawl <- map["opening_crawl"]
        director <- map["director"]
        producer <- map["producer"]
        releaseDate <- map["release_date"]
        starships <- map["starships"]
    }
    
    override func getProperties() -> [ModelProperty] {
         return ModelHelper.getProperties(keys: keys, dict: map)
     }
}
