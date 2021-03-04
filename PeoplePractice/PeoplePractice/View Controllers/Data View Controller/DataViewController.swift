//
//  DataViewController.swift
//  PeoplePractice
//
//  Created by Ilya Baryko on 2.03.21.
//

import UIKit
import Alamofire
import ObjectMapper

class DataViewController: UIViewController {
    
    //  MARK: - Vars
    
    @IBOutlet weak var tableView: UITableView!
    
    private var listModels: [BaseModel] = []
    var sectionName: String?
    var generalUrls: GeneralData?
    
    //  MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(DataTableViewCell.self, forCellReuseIdentifier: "myCell")
        navigationController?.navigationBar.isHidden = false
        navigationItem.title = sectionName
        fetchData()
    }
    
    //  MARK: - Functions
    
    private func fetchData() {
        ApiHelper.parseApi(url: generalUrls?.people ?? "", of: PeopleData.self, name: "People", onSucess: { [weak self] obj in
            if let model = obj as? PeopleData,
               let results = model.results {
                self?.sectionName = obj.object?.rawValue
                self?.listModels = results
            }
            self?.tableView.reloadData()
        })
    }
}

//  MARK: - Extension

extension DataViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell") as! DataTableViewCell
                
        cell.setupCell(modelName: listModels[indexPath.row].name)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = DetailPersonViewController(nibName: "DetailPersonViewController", bundle: nil)
        
        vc.model = listModels[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}
