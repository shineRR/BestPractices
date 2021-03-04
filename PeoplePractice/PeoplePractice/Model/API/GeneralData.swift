//
//  GeneralData.swift
//  PeoplePractice
//
//  Created by Ilya Baryko on 1.03.21.
//

import Foundation

struct GeneralData: Decodable {
    var films: String
    var people: String
    var planets: String
    var species: String
    var starships: String
    var vehicles: String
    
    enum CodingKeys: String, CodingKey {
      case films = "films"
      case people = "people"
      case planets = "planets"
      case species = "species"
      case starships = "starships"
      case vehicles = "vehicles"
    }
}
