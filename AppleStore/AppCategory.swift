//
//  AppCategory.swift
//  AppleStore
//
//  Created by Fernando Cardenas on 18/01/17.
//  Copyright © 2017 Fernando. All rights reserved.
//

import UIKit

class AppCategory: NSObject {
    
    var name: String?
    
    var apps: [App]?
    
    static func sampleAppCategories() -> [AppCategory] {
    

        let bestNewAppCategory = AppCategory()
        bestNewAppCategory.name = "Best new Apps"
        
        
        //logic
        let frozenApp = App()
        frozenApp.name = "Disney Build It: Frozen"
        frozenApp.imageName = "frozen"
        frozenApp.category = "Entertainment"
        frozenApp.price = NSNumber(value: 3.99)
        
        bestNewAppCategory.apps?.append(frozenApp)

        
        let bestNewGamesCategory = AppCategory()
        bestNewGamesCategory.name = "Best new Games"
        
        
        //logic
        let telepaintApp = App()
        telepaintApp.name = "Telepaint"
        telepaintApp.imageName = "telepaint"
        telepaintApp.category = "Games"
        telepaintApp.price = NSNumber(value: 2.99)
        
        bestNewGamesCategory.apps?.append(telepaintApp)
        
        
        return [bestNewAppCategory, bestNewGamesCategory]
    
    }
    
}

class App: NSObject {
    
    var id: NSNumber?
    var name: String?
    var category: String?
    var imageName: String?
    var price: NSNumber?
    
    
}
