//
//  DataTableViewCell.swift
//  PeoplePractice
//
//  Created by Ilya Baryko on 1.03.21.
//

import UIKit

class DataTableViewCell: UITableViewCell {
    
    @IBOutlet weak var name: UILabel!
    
    func setupCell(label: String) {
        self.name.text = label
    }
}
