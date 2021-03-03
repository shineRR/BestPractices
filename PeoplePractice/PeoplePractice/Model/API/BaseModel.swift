//
//  BaseModel.swift
//  PeoplePractice
//
//  Created by Ilya Baryko on 3.03.21.
//

import Foundation
import ObjectMapper

public class BaseMappableModel: NSObject, Mappable {
    
    public required init?(map: Map) {
        super.init()
    }
    
    public required override init() {
        super.init()
    }
    
    public func createUnmanaged() {
    }

    
    public func mapping(map: Map) {
        // override
    }
    
    public func mapping(map: Map, items: Int) {
        // override
    }
    
    func getProperties() -> [ModelProperty] {
        // override
        return [ModelProperty]()
    }
    
}

