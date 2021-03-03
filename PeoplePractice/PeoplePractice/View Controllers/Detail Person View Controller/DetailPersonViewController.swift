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
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let width = UIScreen.main.bounds.width
    private let cellIdentifier = "DetailPersonCell"
    private var person: Person?
    private var personProperties = [ModelProperty]()
    var url: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(UINib(nibName: "DataitPersonCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: cellIdentifier)
        doRequest()
    }
    
    private func doRequest() {
        guard let url = url else { return }
        ApiHelper.requestForPerson(url: url) { person in
            self.person = person
            self.personProperties = person.getProperties()
            self.collectionView.reloadData()
        }
    }
}

extension DetailPersonViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return personProperties.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! DataitPersonCollectionViewCell
        
        cell.setupCell(property: personProperties[indexPath.row].property, value: personProperties[indexPath.row].value)
        
        return cell
    }
}
