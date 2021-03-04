//
//  DataitPersonCollectionViewCell.swift
//  PeoplePractice
//
//  Created by Ilya Baryko on 3.03.21.
//

import UIKit
import Alamofire

enum CellType: Int, CaseIterable {
    case def = 1,
         forwardable
    
    static subscript(_ lines: Int) -> CellType {
        return (def.rawValue == lines) ? .def : .forwardable
    }
}

class DataitPersonCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var propertyLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
    private var personalSubviews = [UIView]()
    private var links = [String]()
    
    private func deleteSubviews() {
        personalSubviews.forEach {
            $0.removeFromSuperview()
        }
    }
    
    private func setupUI() {
        self.layer.cornerRadius = 10
    }
    
    private func setupLink(link: String, minYOffset: CGFloat) {
        ForwardableButton().setupButton(link: link, minYOffset: minYOffset, minX: valueLabel.frame.minX, view: self.contentView, onSucess: { [weak self] button in
            self?.addSubview(button)
            self?.personalSubviews.append(button)
            self?.valueLabel.text = ""
        }, onError: {
            self.valueLabel.text = link
        })
    }
    
    func setupCell(property: String, value: String) {
        
        deleteSubviews()
        setupUI()
        propertyLabel.text = property + ":"
        
        let links = value.components(separatedBy: "\n")
        
        switch CellType[links.count] {
        case .forwardable:
            var minYOffset: CGFloat = 5.0
            for link in links {
                setupLink(link: link, minYOffset: minYOffset)
                minYOffset += 20
            }
        default:
            setupLink(link: value, minYOffset: contentView.frame.midY - 30)
        }
    }
}
