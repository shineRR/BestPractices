//
//  DetailPersonViewController.swift
//  PeoplePractice
//
//  Created by Ilya Baryko on 2.03.21.
//

import UIKit

class DetailPersonViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    private let width = UIScreen.main.bounds.width
    private let cellIdentifier = "DetailPersonCell"
    private var personProperties = [ModelProperty]()
    
    var person: Person?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(UINib(nibName: "DataitPersonCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: cellIdentifier)
        personProperties = person?.getProperties() ?? []
        collectionView.reloadData()
    }
}

extension DetailPersonViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return personProperties.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: width, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! DataitPersonCollectionViewCell
        
        cell.setupCell(property: personProperties[indexPath.row].property, value: personProperties[indexPath.row].value)
        
        return cell
    }
}
