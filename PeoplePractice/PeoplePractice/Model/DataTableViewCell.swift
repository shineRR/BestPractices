//
//  DataTableViewCell.swift
//  PeoplePractice
//
//  Created by Ilya Baryko on 1.03.21.
//

import UIKit

class DataTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    var url: String?
    
    func setupCell(model: ApiData, index: Int) {
        switch model.objectName {
        case "People":
            guard let peopleData = model as? PeopleData,
                  let people = peopleData.results else { return }
            url = people[index].url
            self.nameLabel.text = people[index].name
        case "Starships":
            guard let starshipsData = model as? StarshipsData,
                  let starships = starshipsData.results else { return }
            self.nameLabel.text = starships[index].name
            url = starships[index].url
        case "Species":
            guard let speciesData = model as? SpeciesData,
                  let species = speciesData.results else { return }
            self.nameLabel.text = species[index].name
            url = species[index].url
        case "Films":
            guard let filmsData = model as? FilmsData,
                  let films = filmsData.results else { return }
            self.nameLabel.text = films[index].title
            url = films[index].url
        case "Planets":
            guard let planetsData = model as? PlanetsData,
                  let planets = planetsData.results else { return }
            self.nameLabel.text = planets[index].name
            url = planets[index].url
        case "Vehicles":
            guard let vehicleData = model as? VehiclesData,
                  let vehicles = vehicleData.results else { return }
            self.nameLabel.text = vehicles[index].name
            url = vehicles[index].url
        default:
            self.nameLabel.text = "Name"
        }
    }
}
