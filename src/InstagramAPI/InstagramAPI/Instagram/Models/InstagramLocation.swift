//
//  InstagramLocation.swift
//  ConceptOffice
//
//  Created by Denis on 28.02.16.
//  Copyright © 2016 Den Ree. All rights reserved.
//

import UIKit
import ObjectMapper

class InstagramLocation: InstagramModel {
    
    //MARK: Properties
    fileprivate(set) var latitude: Double?
    fileprivate(set) var longitude: Double?
    fileprivate(set) var streetAddress: String?
    fileprivate(set) var name: String?
    
    required init?(map: Map) {
        super.init(map: map)
    }
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        latitude <- map[Instagram.Keys.Location.latitude]
        longitude <- map[Instagram.Keys.Location.longitude]
        streetAddress <- map[Instagram.Keys.Location.streetAddress]
        name <- map[Instagram.Keys.Location.name]
    }
}
