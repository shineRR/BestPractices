//
//  Species.swift
//  PeoplePractice
//
//  Created by Ilya Baryko on 1.03.21.
//

import Foundation
import ObjectMapper
// вот тут бы я создал общий класс для всех данных
class Species: BaseMappableModel {
    
    var name: String?
    var classification: String?
    var designation: String?
    var avgHeight: String?
    var skinColors: String?
    var hairColors: String?
    var eyeColors: String?
    var avgLifespan: String?
    var homeworld: String?
    var language: String?
    var people: [String]?
    var films: [String]?
    
    // сделать переменную по типу
    var newFilms: [Film] = [] // и вот так каждый массив будет иметь свой класс и мы будем обращаться к главное модели и брать у него данные (если возможно)
    
    var created: String?
    var edited: String?
    var url: String?

    override func mapping(map: Map) {
        name <- map["name"]
        classification <- map["classification"]
        designation <- map["designation"]
        avgHeight <- map["average_height"]
        skinColors <- map["skin_colors"]
        hairColors <- map["hair_colors"]
        eyeColors <- map["eye_colors"]
        avgLifespan <- map["average_lifespan"]
        homeworld <- map["homeworld"]
        language <- map["language"]
        people <- map["people"]
        films <- map["films"]
        created <- map["created"]
        edited <- map["edited"]
        url <- map["url"]
    }
}
