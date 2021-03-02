//
//  ViewController.swift
//  PeoplePractice
//
//  Created by Ilya Baryko on 2.03.21.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    //  MARK: - Vars
    
    @IBOutlet weak var downloadDataButton: UIButton!
    
    private let requestURL = "https://swapi.dev/api/"
    private var generalUrls: GeneralData?
    
    //  MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.isHidden = true
    }
    
    //  MARK: - Functions
    
    @IBAction func downloadTapped(_ sender: Any) {
        doRequest()
    }
    
    private func showTableView(identifier: String) {
        let vc = DataViewController(nibName: "DataViewController", bundle: nil)
        vc.generalUrls = generalUrls
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func setupButton() {
        downloadDataButton.backgroundColor = .green
        downloadDataButton.layer.cornerRadius = 20
    }
    
    private func doRequest() {
        ApiHelper.requestForGeneralData(url: requestURL, onSucess: { [weak self] data in
            self?.generalUrls = data
            self?.showTableView(identifier: "tableViewController")
        })
    }
}
