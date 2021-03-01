//
//  DataViewController.swift
//  PeoplePractice
//
//  Created by Ilya Baryko on 1.03.21.
//

import UIKit
import Alamofire

class DataViewController: UIViewController {
    //  MARK: - Vars
    @IBOutlet weak var tableView: UITableView!
    
    private var headerTitles = [FilmData(count: 0, all: []), PeopleData(count: 0, next: "", previous: "", all: []), PlanetsData(count: 0, next: "", previous: "", all: []), SpeciesData(count: 0, next: "", previous: "", all: []), StarshipsData(count: 0, next: "", previous: "", all: []), VehiclesData(count: 0, next: "", previous: "", all: [])] as [NamableStruct]
    
    private var selectedCell: Displayable?
    
    private var people: PeopleData?
    private var starships: StarshipsData?
    private var planets: PlanetsData?
    private var vehicles: VehiclesData?
    private var species: SpeciesData?
    private var films: FilmData?
    private var dictionary = Dictionary<String, Int>()
    
    var generalUrls: GeneralData?
    var items: [Displayable] = []
    
    //  MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        navigationController?.navigationBar.isHidden = false
        
        fetchData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? DetailPersonViewController, segue.identifier == "peopleSegue" {
            vc.personDisplayable = selectedCell
        }
    }
    
    //  MARK: - Functions
    private func parseApi<T: Decodable>(url: String, of: T.Type) {
        let request = AF.request(url)
        request.validate().responseDecodable(of: T.self) { (response) in
            guard let data = response.value else { return }
            switch data {
                case is PeopleData:
                    self.people = data as? PeopleData
                    self.dictionary[self.people?.structName ?? ""] = self.people?.all.count
                case is StarshipsData:
                    self.starships = data as? StarshipsData
                    self.dictionary[self.starships?.structName ?? ""] = self.starships?.all.count
                case is PlanetsData:
                    self.planets = data as? PlanetsData
                    self.dictionary[self.planets?.structName ?? ""] = self.planets?.all.count
                case is VehiclesData:
                    self.vehicles = data as? VehiclesData
                    self.dictionary[self.vehicles?.structName ?? ""] = self.vehicles?.all.count
                case is FilmData:
                    self.films = data as? FilmData
                    self.dictionary[self.films?.structName ?? ""] = self.films?.all.count
                case is SpeciesData:
                    self.species = data as? SpeciesData
                    self.dictionary[self.species?.structName ?? ""] = self.species?.all.count
                default: print("default")
            }
            self.tableView.reloadData()
        }
    }
    
    private func fetchData() {
        parseApi(url: generalUrls?.people ?? "", of: PeopleData.self)
        parseApi(url: generalUrls?.starships ?? "", of: StarshipsData.self)
        parseApi(url: generalUrls?.films ?? "", of: FilmData.self)
        parseApi(url: generalUrls?.planets ?? "", of: PlanetsData.self)
        parseApi(url: generalUrls?.vehicles ?? "", of: VehiclesData.self)
        parseApi(url: generalUrls?.species ?? "", of: SpeciesData.self)
    }
}
//  MARK: - Extension
extension DataViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return headerTitles.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        headerTitles[section].structName
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dictionary[headerTitles[section].structName] ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dataCell") as! DataTableViewCell
        let section = headerTitles[indexPath.section]
        var cellLabel = ""
        switch section.structName {
        case people?.structName:
            cellLabel = people?.all[indexPath.row].name ?? "Name"
        case planets?.structName:
            cellLabel = planets?.all[indexPath.row].name ?? "Name"
        case films?.structName:
            cellLabel = films?.all[indexPath.row].title ?? "Title"
        case starships?.structName:
            cellLabel = starships?.all[indexPath.row].name ?? "Name"
        case vehicles?.structName:
            cellLabel = vehicles?.all[indexPath.row].name ?? "Name"
        case species?.structName:
            cellLabel = species?.all[indexPath.row].name ?? "Name"
        default:
            cellLabel = "Name"
        }
        cell.setupCell(label: cellLabel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        var segueIdentifier = "peopleSegue"
        
        let section = headerTitles[indexPath.section]
        switch section.structName {
        case people?.structName:
            selectedCell = people?.all[indexPath.row]
            segueIdentifier = "peopleSegue"
        case planets?.structName:
            selectedCell = planets?.all[indexPath.row]
            segueIdentifier = "peopleSegue"
        case films?.structName:
            selectedCell = films?.all[indexPath.row]
            segueIdentifier = "peopleSegue"
        case starships?.structName:
            selectedCell = starships?.all[indexPath.row]
            segueIdentifier = "peopleSegue"
        case vehicles?.structName:
            selectedCell = vehicles?.all[indexPath.row]
            segueIdentifier = "peopleSegue"
        case species?.structName:
            selectedCell = species?.all[indexPath.row]
            segueIdentifier = "peopleSegue"
        default:
            debugPrint("Error!")
        }
        performSegue(withIdentifier: segueIdentifier, sender: nil)
    }
}
