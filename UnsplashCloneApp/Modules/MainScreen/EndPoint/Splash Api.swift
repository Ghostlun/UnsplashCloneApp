//
//  Splash Api.swift
//  UnsplashCloneApp
//
//  Created by Yoonha Kim on 5/10/21.
//

import Foundation

enum SplashCollectionApi: EndPoint {
    
    case collection
    var task: HTTPTask {
        .request
    }

    var baseURL: URL {
        guard let url = URL(string: "https://api.unsplash.com/collections/?client_id=2e5zRIIUowkNDy00Hh41zKFlmpyFtmBja6DuA-CIn88" ) else {
            fatalError("URL won't work")
        }
        return url
    }
    
    var baseUrlOption: String {
        return "https://api.unsplash.com/collections/?client_id=2e5zRIIUowkNDy00Hh41zKFlmpyFtmBja6DuA-CIn88"
    }
    
    var path: String {
        return ""
    }
    
    var apiKey: String {
          ""
      }
    
    var fullAddress: String {
       return baseUrlOption + path + apiKey
    }
}
