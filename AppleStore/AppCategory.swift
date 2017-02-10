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
    
    
//    static func sampleAppCategories() -> [AppCategory] {
//    
//
//        var bestNewAppCategory = AppCategory()
//        bestNewAppCategory.name = "Best new Apps"
//        
//        
//        //logic
//        var frozenApp = App()
//        frozenApp.name = "Disney Build It: Frozen"
//        frozenApp.imageName = "frozen"
//        frozenApp.category = "Entertainment"
//        frozenApp.price = NSNumber(value: 3.99)
//        
//        bestNewAppCategory.apps = [App]()
//        bestNewAppCategory.apps?.append(frozenApp)
//
//        
//        var bestNewGamesCategory = AppCategory()
//        bestNewGamesCategory.name = "Best new Games"
//        
//        bestNewGamesCategory.apps = [App]()
//
//        //logic
//        var telepaintApp = App()
//        telepaintApp.name = "Telepaint"
//        telepaintApp.imageName = "telepaint"
//        telepaintApp.category = "Games"
//        telepaintApp.price = NSNumber(value: 2.99)
//        
//        var starwarsApp = App()
//        starwarsApp.name = "Star Wars"
//        starwarsApp.imageName = "starwars"
//        starwarsApp.category = "Games"
//        starwarsApp.price = NSNumber(value: 5.99)
//        
//        bestNewGamesCategory.apps?.append(telepaintApp)
//        bestNewGamesCategory.apps?.append(starwarsApp)
//        
//        
//        return [bestNewAppCategory, bestNewGamesCategory]
//    
//    }
    
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

