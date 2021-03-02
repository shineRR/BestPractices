//
//  DetailPersonViewController.swift
//  PeoplePractice
//
//  Created by Ilya Baryko on 2.03.21.
//

import UIKit

//fileprivate let privateIdentifier = "TableViewCell"

class DetailPersonViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private var person: Person?
    var url: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "YourCell")
        doRequest()
    }
    
//    private func setupLabel() {
//        nameLabel.text = person?.name
//        heightLabel.text = person?.height
//        massLabel.text = person?.mass
//        hairColorLabel.text = person?.hairColor
//        skinColorLabel.text = person?.skinColor
//        eyeColorLabel.text = person?.eyeColor
//        birthYearLabel.text = person?.birthYear
//        genderLabel.text = person?.gender
//    }
    
    private func doRequest() {
        guard let url = url else { return }
        ApiHelper.requestForPerson(url: url) { person in
            self.person = person
//            self.setupLabel()
        }
    }
}

extension DetailPersonViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "YourCell", for: indexPath)
        
        return cell
    }
    
    
}
