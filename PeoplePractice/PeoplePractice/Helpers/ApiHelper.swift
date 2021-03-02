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
    
    func parseApi<T: Mappable>(url: String, of: T.Type, name: String, onSucess: @escaping (_ obj: ApiData) -> ()) {
        let request = AF.request(url)
        request.responseJSON { (response) in
            guard var data = response.value as? [String: Any] else { return }
            data["objectName"] = name
            
            guard let classData = T(JSON: data) as? ApiData else { return }
            onSucess(classData)
        }
    }
    
    func requestForPerson(url: String, onSucess: @escaping (_ person: Person) -> ()) {
        let request = AF.request(url)
        request.responseJSON { (response) in
            guard let data = response.value as? [String: Any],
                  let person = Person(JSON: data)  else { return }
            onSucess(person)
        }
    }
    
    func requestForGeneralData(url: String, onSucess: @escaping (_ data: GeneralData) -> ()) {
        let request = AF.request(url)
        request.responseDecodable(of: GeneralData.self) { (response) in
            guard let data = response.value else { return }
            onSucess(data)
        }
    }
}
