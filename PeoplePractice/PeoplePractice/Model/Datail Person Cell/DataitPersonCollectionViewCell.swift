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
    
    private func setupLink(link: String, minYOffset: CGFloat, vc: DetailPersonViewController, i: Int) {
        ForwardableButton().setupButton(link: link, minYOffset: minYOffset, minX: valueLabel.frame.minX + 20, view: self.contentView, vc: vc, onSucess: { [weak self] button in
            button.setTitle("Link #\(i)", for: .normal)
            self?.addSubview(button)
            self?.personalSubviews.append(button)
            self?.valueLabel.text = ""
        }, onError: {
            let date = link.toDate()
            guard let time = date?.toFormat("dd.MM.yyyy") else {
                self.valueLabel.text = link
                return
            }
            self.valueLabel.text = time
        })
    }
    
    func setupCell(property: String, value: String, vc: DetailPersonViewController) {
        
        deleteSubviews()
        setupUI()
        propertyLabel.text = property + ":"
        
        let links = value.components(separatedBy: "\n")
        
        switch CellType[links.count] {
        case .forwardable:
            let step = self.frame.height / CGFloat(links.count) + 5
            var minYOffset: CGFloat = 10.0
            for (i, link) in links.enumerated() {
                setupLink(link: link, minYOffset: minYOffset, vc: vc, i: i + 1)
                minYOffset += step
            }
        default:
            setupLink(link: value, minYOffset: contentView.frame.midY - 30, vc: vc, i: 1)
        }
    }
}
