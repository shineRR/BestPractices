//
//  DataTableViewCell.swift
//  PeoplePractice
//
//  Created by Ilya Baryko on 1.03.21.
//

import UIKit

class DataTableViewCell: UITableViewCell {
    
    func setupCell(modelName: String?) {
        self.textLabel?.text = modelName
    }
}
