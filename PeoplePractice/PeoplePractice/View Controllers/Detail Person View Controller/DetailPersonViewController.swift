//
//  DetailPersonViewController.swift
//  PeoplePractice
//
//  Created by Ilya Baryko on 2.03.21.
//

import UIKit

protocol PushableVC {
    func navigateToNextModel(url: String)
}

class DetailPersonViewController: UIViewController, PushableVC {

    @IBOutlet weak var collectionView: UICollectionView!
    
    private let width = UIScreen.main.bounds.width
    private let defaultCellHeight = 100.0
    private let cellIdentifier = "DetaitPerson"
    private var modelProperties = [ModelProperty]()
    
    var model: BaseModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(UINib(nibName: "GeneralPropertyCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: cellIdentifier)
        navigationItem.title = model?.name
        modelProperties = model?.getProperties() ?? []
        collectionView.reloadData()
    }
    
    func navigateToNextModel(url: String) {
        let vc = DetailPersonViewController(nibName: "DetailPersonViewController", bundle: nil)
        
        ApiHelper.parseSingleModel(url: url, onSucess: { [weak self] model in
            vc.model = model
            self?.navigationController?.pushViewController(vc, animated: true)
        })
    }
}

extension DetailPersonViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return modelProperties.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let value = modelProperties[indexPath.row].value
        let lines = value.components(separatedBy: "\n").count
        
        return CGSize(width: width, height: lines > 1 ? 150 : 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! GeneralPropertyCollectionViewCell
        
        cell.setupCell(property: modelProperties[indexPath.row].property, value: modelProperties[indexPath.row].value, completionHandler: { [weak self] url in
    
            self?.navigateToNextModel(url: url)
        })
        return cell
    }
}
