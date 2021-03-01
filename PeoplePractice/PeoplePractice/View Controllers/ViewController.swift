//
//  ViewController.swift
//  PeoplePractice
//
//  Created by Ilya Baryko on 1.03.21.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    //  MARK: - Vars
    @IBOutlet weak var downloadData: UIButton!
    
    private var canWind: Bool = false
    private var generalUrls: GeneralData?
    
    //  MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupButton()
        doRequest()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.isHidden = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if canWind, let vc = segue.destination as? DataViewController, segue.identifier == "dataTableView" {
            vc.generalUrls = generalUrls
        }
    }
    //  MARK: - Functions
    @IBAction func downloadTapped(_ sender: Any) {
        canWind ? performSegue(withIdentifier: "dataTableView", sender: nil) : doRequest()
    }
    
    private func setupButton() {
        downloadData.backgroundColor = .green
        downloadData.layer.cornerRadius = 20
    }
    
    private func doRequest() {
        let request = AF.request("https://swapi.dev/api/")
        request.responseDecodable(of: GeneralData.self) { (response) in
            guard let data = response.value else { return }
            self.canWind = true
            self.generalUrls = data
        }
    }
}
