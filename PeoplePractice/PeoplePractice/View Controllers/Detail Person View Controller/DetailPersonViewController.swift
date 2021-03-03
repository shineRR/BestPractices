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
        
        let value = personProperties[indexPath.row].value
        let lines = value.components(separatedBy: "\n").count
        let height: CGFloat = CGFloat(Double(lines) * 40 - (40 * Double(lines) * 0.4))
        
        
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! DataitPersonCollectionViewCell
        
        
        
        cell.setupCell(property: personProperties[indexPath.row].property, value: personProperties[indexPath.row].value)
        
        return cell
    }
}
