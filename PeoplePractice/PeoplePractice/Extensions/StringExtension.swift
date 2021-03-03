//
//  StringExtension.swift
//  PeoplePractice
//
//  Created by Ilya Baryko on 3.03.21.
//

import Foundation

extension String {
    func normalize() -> String {
        let result = self.replacingOccurrences(of: "_", with: " ")
        return result.capitalized
    }
}
