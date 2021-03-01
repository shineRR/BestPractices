//
//  DetailPersonViewController.swift
//  PeoplePractice
//
//  Created by Ilya Baryko on 1.03.21.
//

import UIKit
import Alamofire

class DetailPersonViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var massLabel: UILabel!
    @IBOutlet weak var hairColorLabel: UILabel!
    @IBOutlet weak var skinColorLabel: UILabel!
    @IBOutlet weak var eyeColorLabel: UILabel!
    @IBOutlet weak var birthYearLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    
    private var person: Person?
    var personDisplayable: Displayable?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationItem.title = personDisplayable?.name
        doRequest()
    }
    
    func setupLabel() {
        nameLabel.text = person?.name
        heightLabel.text = person?.height
        massLabel.text = person?.mass
        hairColorLabel.text = person?.hairColor
        skinColorLabel.text = person?.skinColor
        eyeColorLabel.text = person?.eyeColor
        birthYearLabel.text = person?.birthYear
        genderLabel.text = person?.gender
    }
    
    func doRequest() {
        guard let url = personDisplayable?.url else { return }
        let request = AF.request(url)
        
        request.responseDecodable(of: Person.self) { (response) in
            guard let data = response.value else { return }
            
            self.person = data
            self.setupLabel()
        }
    }
}
