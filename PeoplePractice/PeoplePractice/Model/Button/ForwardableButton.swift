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
    
    @objc func hyperlink() {
        print(url)
    }
    
    func setupButton(link: String, minYOffset: CGFloat, minX: CGFloat, view: UIView, onSucess: @escaping (_ button: ForwardableButton) -> (), onError: @escaping () -> ()) {
        let url = link.replacingOccurrences(of: " ", with: "")
        if url.isValidURL() {
            let width = view.frame.maxX - minX
            self.frame = CGRect(x: minX, y: view.frame.minY + minYOffset, width: width - 20, height: 25)
            addTarget(self, action: #selector(hyperlink), for: .touchUpInside)
            setTitle("Link #", for: .normal)
            self.url = url
            onSucess(self)
        } else {
            onError()
        }
    }
}
