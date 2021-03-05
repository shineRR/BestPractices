//
//  ApiHelper.swift
//  PeoplePractice
//
//  Created by Ilya Baryko on 2.03.21.
//

import Foundation
import Alamofire
import ObjectMapper

class ApiHelper {
    
    static func parseSingleModel(url: String, onSucess: @escaping (_ obj: BaseModel) -> ()) {
        let request = AF.request(url)
        request.responseJSON { (response) in
            guard var data = response.value as? [String: Any] else { return }
            
            let modelType = ModelTypes[url]
            var classData: BaseModel?
            data["objectName"] = modelType.rawValue
            
            switch modelType {
            case .films:
                classData = Film(JSON: data)
            case .people:
                classData = Person(JSON: data)
            case .planets:
                classData = Planet(JSON: data)
            case .species:
                classData = Species(JSON: data)
            case .starships:
                classData = Starship(JSON: data)
            case .vehicles:
                classData = Vehicle(JSON: data)
            default:
                break
            }
            
            guard let model = classData else { return }
            onSucess(model)
        }
    }
    
    static func parseApi<T: Mappable>(url: String, of: T.Type, name: String,
                                      onSucess: @escaping (_ obj: ApiData) -> ()) {
        let request = AF.request(url)
        request.responseJSON { (response) in
            guard var data = response.value as? [String: Any] else { return }
            data["objectName"] = name
            
            guard let classData = T(JSON: data) as? ApiData else { return }
            onSucess(classData)
        }
    }
    
    static func requestForPerson(url: String, onSucess: @escaping (_ person: Person) -> ()) {
        let request = AF.request(url)
        request.responseJSON { (response) in
            guard let data = response.value as? [String: Any],
                  let person = Person(JSON: data)  else { return }
            onSucess(person)
        }
    }
    
    static func requestForGeneralData(url: String, onSucess: @escaping (_ data: GeneralData) -> ()) {
        let request = AF.request(url)
        request.responseDecodable(of: GeneralData.self) { (response) in
            guard let data = response.value else { return }
            onSucess(data)
        }
    }
}
