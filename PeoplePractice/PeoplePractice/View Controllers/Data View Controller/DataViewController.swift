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
    
    private var entireModel: ApiData?
    private var listModels: [BaseModel] = []
    private var sectionName: String?
    private var isLoading: Bool = true
    var generalUrls: GeneralData?
    
    //  MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(DataTableViewCell.self, forCellReuseIdentifier: "myCell")
        navigationController?.navigationBar.isHidden = false
        fetchData(url: generalUrls?.people ?? "")
    }
    
    //  MARK: - Functions
    
    private func fetchData(url: String) {
        ApiHelper.parseApi(url: url, of: PeopleData.self, name: "People", onSucess: { [weak self] obj in
            DispatchQueue.main.async {
                if let model = obj as? PeopleData,
                   let results = model.results {
                    self?.entireModel = obj
                    self?.sectionName = obj.object?.rawValue
                    self?.listModels += results
                }
                self?.tableView.reloadData()
                self?.isLoading = false
            }
        })
    }
}

//  MARK: - Extension

extension DataViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionName
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listModels.count
    }
    
    func loadMoreData() {
        guard let url = entireModel?.next, !isLoading else { return }
        
        isLoading = true
        fetchData(url: url)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == (listModels.count - 1) {
            DispatchQueue.global().async {
                self.loadMoreData()
            }
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell") as! DataTableViewCell
        
        cell.setupCell(modelName: listModels[indexPath.row].name)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = DetailPersonViewController(nibName: "DetailPersonViewController", bundle: nil)
        guard let dataFromCell = tableView.cellForRow(at: indexPath) as? DataTableViewCell else { return }
        
        vc.person = listModels[indexPath.row] as? Person
        vc.navigationItem.title = dataFromCell.textLabel?.text
    
        navigationController?.pushViewController(vc, animated: true)
    }
}
