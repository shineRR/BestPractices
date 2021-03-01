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
    
    private var headerTitles: [NamebleStruct] = []
    
    private var selectedCell: Displayable?
    
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
            guard let data = response.value as? NamebleStruct else { return }
            self.headerTitles.append(data)
            print(data.pageCount)
            self.dictionary[data.structName] = data.pageCount
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
        case "People":
            guard let data = section as? PeopleData else { break }
            cellLabel = data.all[indexPath.row].name
        case "Starships":
            guard let data = section as? StarshipsData else { break }
            cellLabel = data.all[indexPath.row].name
        case "Vehicles":
            guard let data = section as? VehiclesData else { break }
            cellLabel = data.all[indexPath.row].name
        case "Planets":
            guard let data = section as? PlanetsData else { break }
            cellLabel = data.all[indexPath.row].name
        case "Films":
            guard let data = section as? FilmData else { break }
            cellLabel = data.all[indexPath.row].name
        default:
            debugPrint("Error")
        }
        
        cell.setupCell(label: cellLabel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        var segueIdentifier = "peopleSegue"
        
        let section = headerTitles[indexPath.section]
        
        switch section.structName {
        case "People":
            guard let data = section as? PeopleData else { break }
            selectedCell = data.all[indexPath.row]
            segueIdentifier = "peopleSegue"
        case "Starships":
            guard let data = section as? StarshipsData else { break }
            selectedCell = data.all[indexPath.row]
            segueIdentifier = "peopleSegue"
        case "Vehicles":
            guard let data = section as? VehiclesData else { break }
            selectedCell = data.all[indexPath.row]
            segueIdentifier = "peopleSegue"
        case "Planets":
            guard let data = section as? PlanetsData else { break }
            selectedCell = data.all[indexPath.row]
            segueIdentifier = "peopleSegue"
        case "Films":
            guard let data = section as? FilmData else { break }
            selectedCell = data.all[indexPath.row]
            segueIdentifier = "peopleSegue"
        default:
            debugPrint("Error")
        }
        
        performSegue(withIdentifier: segueIdentifier, sender: nil)
    }
}
