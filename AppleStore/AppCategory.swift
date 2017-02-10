//
//  AppCategory.swift
//  AppleStore
//
//  Created by Fernando Cardenas on 18/01/17.
//  Copyright © 2017 Fernando. All rights reserved.
//

import UIKit

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
    
}

enum SerializationError: Error {
    case missing(String)
    case invalid(String, Any)
}

