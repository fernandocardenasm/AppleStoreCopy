//
//  AppCategory.swift
//  AppleStore
//
//  Created by Fernando Cardenas on 18/01/17.
//  Copyright © 2017 Fernando. All rights reserved.
//

import UIKit
import TRON
import SwiftyJSON

struct AppCategory{
    
    var name: String?
    
    var type: String?
    
    var apps: [App]?
    
    
}

struct App {
    
    var id: NSNumber?
    var name: String?
    var category: String?
    var imageName: String?
    var price: NSNumber?
    
    init(json: JSON){
        self.id = json["Id"].number
        self.name = json["Name"].string
        self.category = json["Category"].string
        self.imageName = json["ImageName"].string
        self.price = json["Price"].number
    }
    
}

enum SerializationError: Error {
    case missing(String)
    case invalid(String, Any)
}

