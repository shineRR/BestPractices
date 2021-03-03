//
//  DataitPersonCollectionViewCell.swift
//  PeoplePractice
//
//  Created by Ilya Baryko on 3.03.21.
//

import UIKit

class DataitPersonCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var propertyLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupCell(property: String, value: String) {
        self.layer.cornerRadius = 10
        propertyLabel.text = property + ":"
        valueLabel.text = value
    }
}
