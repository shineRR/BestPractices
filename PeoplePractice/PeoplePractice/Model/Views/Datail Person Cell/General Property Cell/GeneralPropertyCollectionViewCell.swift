//
//  DataitPersonCollectionViewCell.swift
//  PeoplePractice
//
//  Created by Ilya Baryko on 3.03.21.
//

import UIKit
import Alamofire
import SwiftDate

enum CellType: Int, CaseIterable {
    case def = 1,
         forwardable
    
    static subscript(_ lines: Int) -> CellType {
        return (def.rawValue == lines) ? .def : .forwardable
    }
}

class GeneralPropertyCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var propertyLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let identifier = "DetailCell"
    private var links = [String]()
    
    var delegate: PushableVC?
    
    override func awakeFromNib() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: "DetailCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: identifier)
    }
    
    private func setupLinks(links: [String]) {
        var optionalValue = ""
        for link in links {
            let url = link.replacingOccurrences(of: " ", with: "")
            if url.isValidURL() {
                self.links.append(url)
            } else {
                optionalValue += link
            }
        }
        
        valueLabel.text = optionalValue
    }
    
    func setupCell(property: String, value: String) {
        
        propertyLabel.text = property + ":"
        
        self.links.removeAll()
        let links = value.components(separatedBy: "\n")
        
        switch CellType[links.count] {
        case .forwardable:
            setupLinks(links: links)
        default:
            let val = value.validateDate()
            setupLinks(links: [val])
        }
        
        collectionView.reloadData()
    }
}

extension GeneralPropertyCollectionViewCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return links.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        valueLabel.frame = CGRect(x: valueLabel.frame.minX, y: valueLabel.frame.minY, width: valueLabel.frame.width, height: 0)
        
        
        return CGSize(width: collectionView.frame.width, height: 30)
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! DetailCollectionViewCell
        
        cell.setup(url: links[indexPath.row], index: indexPath.row + 1)

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.navigateToNextModel(url: links[indexPath.row])
    }
}
