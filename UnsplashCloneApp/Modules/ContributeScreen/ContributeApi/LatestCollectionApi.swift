//
//  LatestCollectionApi.swift
//  UnsplashCloneApp
//
//  Created by Yoonha Kim on 5/11/21.
//

import Foundation

enum LatestCollectionApi: EndPoint {
    
//    https://api.unsplash.com/photos?page=1&per_page=10&client_id=2e5zRIIUowkNDy00Hh41zKFlmpyFtmBja6DuA-CIn88
    
    case collection
    
    var task: HTTPTask {
        .request
    }
    
    var baseUrlOption: String {
        "https://api.unsplash.com/photos?page=1&per_page=10"
    }
    
    var path: String {
         ""
    }
    
    var apiKey: String {
          "&client_id=2e5zRIIUowkNDy00Hh41zKFlmpyFtmBja6DuA-CIn88"
      }
    
    var fullAddress: String {
        baseUrlOption + path + apiKey
    }
}
