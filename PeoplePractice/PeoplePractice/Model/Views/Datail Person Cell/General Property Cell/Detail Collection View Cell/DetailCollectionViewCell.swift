//
//  DetailCollectionViewCell.swift
//  PeoplePractice
//
//  Created by Ilya Baryko on 4.03.21.
//

import UIKit

class DetailCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var linkLabel: UILabel!
    
    private var url: String?
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupUI() {
//        backgroundColor = .re
        layer.borderWidth = 2.0
        layer.borderColor = CGColor(red: 127 / 255, green: 127 / 255, blue: 127 / 255, alpha: 0.4)
        
    }
    
    func setup(url: String, index: Int) {
        
        setupUI()
        linkLabel.text = "Link #\(index)"
        self.url = url
    }
}
