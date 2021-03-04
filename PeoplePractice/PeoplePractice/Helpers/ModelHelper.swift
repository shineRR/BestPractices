//
//  ModelHelper.swift
//  PeoplePractice
//
//  Created by Ilya Baryko on 3.03.21.
//

import Foundation

struct ModelProperty {
    var property: String
    var value: String
}

class ModelHelper {
    static func getProperties(keys: [String], dict: Dictionary<String, Any>) -> [ModelProperty] {
        
        var properties = [ModelProperty]()
           for key in keys {
               if let value = dict[key] as? String, !value.isEmpty {
                   properties.append(ModelProperty(property: key.normalize(), value: value))
               } else if let value = dict[key] as? [String], !value.isEmpty {
                   var string = ""
                   for item in value {
                       string += "\(item) \n"
                   }
                   
                   properties.append(ModelProperty(property: key.normalize(), value: String(string.dropLast())))
               }
           }
           return properties
    }
}
