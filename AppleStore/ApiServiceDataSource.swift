//
//  ApiService.swift
//  AppleStore
//
//  Created by Fernando Cardenas on 1/02/17.
//  Copyright © 2017 Fernando. All rights reserved.
//

import TRON
import SwiftyJSON


class HomeFeatured: JSONDecodable {
    
    var appCategories: [AppCategory]?
    
    required init(json: JSON) throws {
        print("")
        
        appCategories = [AppCategory]()
        
        guard let arrayCategories = json["categories"].array else {
            throw SerializationError.missing("categories")
        }
        
        for category in arrayCategories {
            
            var categoryAux = AppCategory()
            
            guard let nameCategory = category["name"].string else {
                throw SerializationError.missing("nameCategory")
            }
                
            guard let typeCategory = category["type"].string else {
                throw SerializationError.missing("typeCategory")
            }
                
            guard let appsCategory = category["apps"].array else {
                throw SerializationError.missing("appsCategory")
            }
            
            var appsCategoryAux = [App]()
            
            for app in appsCategory {
                
                var appAux = App()
                
                appAux.id = app["Id"].number
                appAux.name = app["Name"].string
                appAux.category = app["Category"].string
                appAux.imageName = app["ImageName"].string
                appAux.price = app["Price"].number
                                
                appsCategoryAux.append(appAux)
                
            }
            
            categoryAux.name = nameCategory
            categoryAux.type = typeCategory
            categoryAux.apps = appsCategoryAux
            
            appCategories?.append(categoryAux)
            
        }
        
    }
    
}


class JSONError: JSONDecodable {
    required init(json: JSON) throws {
        print("JSON ERROR")
    }
}

struct ApiServiceDataSource {
    
    static let sharedInstance = ApiServiceDataSource()
    
    let tron = TRON(baseURL: "http://www.statsallday.com/appstore")
    
    func fetchFeaturedAppsFeed(_ completion: @escaping ([AppCategory]) ->()) {
        
        let request: APIRequest <HomeFeatured, JSONError> = tron.request("/featured")
        
        request.perform(withSuccess: { (homeDataSource) in
            print("Successfully fetched our json objects.")
            
            if let categories = homeDataSource.appCategories {
                completion(categories)
            }
            //self.appCategories = homeDataSource.appCategories
            
        }) { (err) in
            print("Failed to fetch...", err)
        }
        
    }
    
}
