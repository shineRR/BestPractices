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
                  let array = peopleData.results else { return }
            url = array[index].url
            self.nameLabel.text = array[index].name
        case "Starships":
            guard let starshipsData = model as? StarshipsData,
                  let array = starshipsData.results else { return }
            self.nameLabel.text = array[index].name
            url = array[index].url
        case "Species":
            guard let speciesData = model as? SpeciesData,
                  let array = speciesData.results else { return }
            self.nameLabel.text = array[index].name
            url = array[index].url
        case "Films":
            guard let filmsData = model as? FilmsData,
                  let array = filmsData.results else { return }
            self.nameLabel.text = array[index].title
            url = array[index].url
        case "Planets":
            guard let planetsData = model as? PlanetsData,
                  let array = planetsData.results else { return }
            self.nameLabel.text = array[index].name
            url = array[index].url
        case "Vehicles":
            guard let vehicleData = model as? VehiclesData,
                  let array = vehicleData.results else { return }
            self.nameLabel.text = array[index].name
            url = array[index].url
        default:
            self.nameLabel.text = "Name"
        }
    }
}
