//
//  DataTableViewCell.swift
//  PeoplePractice
//
//  Created by Ilya Baryko on 1.03.21.
//

import UIKit

class DataTableViewCell: UITableViewCell {
    
    var url: String?
    
    func setupCell(model: ApiData, index: Int) {
        switch ApiData[model] {
        case .people:
            guard let peopleData = model as? PeopleData,
                  let people = peopleData.results else { return }
            url = people[index].url
            self.textLabel?.text = people[index].name
        case .starships:
            guard let starshipsData = model as? StarshipsData,
                  let starships = starshipsData.results else { return }
            self.textLabel?.text = starships[index].name
            url = starships[index].url
        case .species:
            guard let speciesData = model as? SpeciesData,
                  let species = speciesData.results else { return }
            self.textLabel?.text = species[index].name
            url = species[index].url
        case .films:
            guard let filmsData = model as? FilmsData,
                  let films = filmsData.results else { return }
            self.textLabel?.text = films[index].title
            url = films[index].url
        case .planets:
            guard let planetsData = model as? PlanetsData,
                  let planets = planetsData.results else { return }
            self.textLabel?.text = planets[index].name
            url = planets[index].url
        case .vehicles:
            guard let vehicleData = model as? VehiclesData,
                  let vehicles = vehicleData.results else { return }
            self.textLabel?.text = vehicles[index].name
            url = vehicles[index].url
        default:
            self.textLabel?.text = "Name"
        }
    }
}
