//
//  DataViewController.swift
//  PeoplePractice
//
//  Created by Ilya Baryko on 1.03.21.
//

import UIKit
import Alamofire
import ObjectMapper

class DataViewController: UIViewController {
    //  MARK: - Vars
    
    @IBOutlet weak var tableView: UITableView!
    
    private var headerTitles: [ApiData] = []
    
    var generalUrls: GeneralData?
    
    //  MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        navigationController?.navigationBar.isHidden = false
        fetchData()
    }
    
    //  MARK: - Functions
    
    private func fetchData() {
        let closure: (_ obj: ApiData) -> () = { [weak self] obj in
            self?.headerTitles.append(obj)
            self?.tableView.reloadData()
        }
        ApiHelper().parseApi(url: generalUrls?.people ?? "", of: PeopleData.self, name: "People", onSucess: closure)
        ApiHelper().parseApi(url: generalUrls?.starships ?? "", of: StarshipsData.self, name: "Starships", onSucess: closure)
        ApiHelper().parseApi(url: generalUrls?.films ?? "", of: FilmsData.self, name: "Films", onSucess: closure)
        ApiHelper().parseApi(url: generalUrls?.planets ?? "", of: PlanetsData.self, name: "Planets", onSucess: closure)
        ApiHelper().parseApi(url: generalUrls?.vehicles ?? "", of: VehiclesData.self, name: "Vehicles", onSucess: closure)
        ApiHelper().parseApi(url: generalUrls?.species ?? "", of: SpeciesData.self, name: "Species", onSucess: closure)
    }
}
//  MARK: - Extension

extension DataViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return headerTitles.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return headerTitles[section].objectName
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return headerTitles[section].currentPageCount ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "dataCell") as! DataTableViewCell
        let model = headerTitles[indexPath.section]
        cell.setupCell(model: model, index: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        let dataFromCell = tableView.cellForRow(at: indexPath) as? DataTableViewCell
        
        guard let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "personPage") as? DetailPersonViewController else { return }
        vc.url = dataFromCell?.url
        vc.navigationItem.title = dataFromCell?.nameLabel.text
        navigationController?.pushViewController(vc, animated: true)
    }
}
