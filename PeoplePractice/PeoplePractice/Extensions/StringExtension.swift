//
//  StringExtension.swift
//  PeoplePractice
//
//  Created by Ilya Baryko on 3.03.21.
//

import Foundation
import UIKit

extension String {
    func normalize() -> String {
        let result = self.replacingOccurrences(of: "_", with: " ")
        return result.capitalized
    }
    
    func isValidURL() -> Bool {
        if let url = NSURL(string: self) {
            return UIApplication.shared.canOpenURL(url as URL)
        }
        return false
    }
    
    func parse(element: String) -> Bool {
        return self.contains(element)
    }
    
}
