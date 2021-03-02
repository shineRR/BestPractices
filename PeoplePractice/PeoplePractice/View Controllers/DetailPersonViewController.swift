//
//  DetailPersonViewController.swift
//  PeoplePractice
//
//  Created by Ilya Baryko on 1.03.21.
//

import UIKit
import Alamofire

class DetailPersonViewController: UIViewController {
    
    //  MARK: - Vars
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var massLabel: UILabel!
    @IBOutlet weak var hairColorLabel: UILabel!
    @IBOutlet weak var skinColorLabel: UILabel!
    @IBOutlet weak var eyeColorLabel: UILabel!
    @IBOutlet weak var birthYearLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    
    private var person: Person?
    var url: String?
    
    //  MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        doRequest()
    }
    
    //  MARK: - Functions
    
    private func setupLabel() {
        nameLabel.text = person?.name
        heightLabel.text = person?.height
        massLabel.text = person?.mass
        hairColorLabel.text = person?.hairColor
        skinColorLabel.text = person?.skinColor
        eyeColorLabel.text = person?.eyeColor
        birthYearLabel.text = person?.birthYear
        genderLabel.text = person?.gender
    }
    
    private func doRequest() {
        guard let url = url else { return }
        ApiHelper.requestForPerson(url: url) { person in
            self.person = person
            self.setupLabel()
        }
    }
}
