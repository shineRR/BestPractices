//
//  ForwardableButton.swift
//  PeoplePractice
//
//  Created by Ilya Baryko on 4.03.21.
//

import Foundation
import UIKit

class ForwardableButton: UIButton {
    
    var url: String?
    var vc: DetailPersonViewController?
    
    @objc func navigateToNextModel() {
        guard let vc = vc,
              let url = url else { return }
        vc.navigateToNextModel(url: url)
    }
    
    func setupButton(link: String, minYOffset: CGFloat, minX: CGFloat, view: UIView, vc: DetailPersonViewController, onSucess: @escaping (_ button: ForwardableButton) -> (), onError: @escaping () -> ()) {
        let url = link.replacingOccurrences(of: " ", with: "")
        if url.isValidURL() {
            self.vc = vc
            let width = view.frame.maxX - minX
            self.frame = CGRect(x: minX, y: view.frame.minY + minYOffset, width: width - 20, height: 25)
            addTarget(self, action: #selector(navigateToNextModel), for: .touchUpInside)
            setTitle("Link #", for: .normal)
            self.url = url
            onSucess(self)
        } else {
            onError()
        }
    }
}
