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
                
                appsCategoryAux.append(App(json: app))
                
            }
            
            appCategories?.append(AppCategory(name: nameCategory, type: typeCategory, apps: appsCategoryAux))
            
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
            
        }) { (err) in
            print("Failed to fetch...", err)
        }
        
    }
    
}
