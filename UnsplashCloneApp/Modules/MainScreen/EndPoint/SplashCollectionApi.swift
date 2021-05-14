//
//  SplashCollectionApi Api.swift
//  UnsplashCloneApp
//
//  Created by Yoonha Kim on 5/10/21.
//

import Foundation

enum SplashCollectionApi: EndPoint {
    
    case searchByCategory(category: String)
    case searchByDefault
    
//  Default address https://api.unsplash.com/topics?page=1&id_or_slug=wallpapers&client_id=2e5zRIIUowkNDy00Hh41zKFlmpyFtmBja6DuA-CIn88

//  Search Address https://api.unsplash.com/topics/wallpapers/photos?page=1&client_id=2e5zRIIUowkNDy00Hh41zKFlmpyFtmBja6DuA-CIn88
    
//    https://api.unsplash.com/topics/Wallpapers/photos?page=1&client_id=2e5zRIIUowkNDy00Hh41zKFlmpyFtmBja6DuA-CIn88
    var task: HTTPTask {
        .request
    }
    
    var baseUrlOption: String {
        "https://api.unsplash.com"
    }
    
    var path: String {
        switch self {
        case .searchByCategory(let category):
            return "/topics/\(category)/photos?page=1"
            
        case .searchByDefault:
            return "/topics?page=1"
        }
    }
    
    var apiKey: String {
          "&client_id=2e5zRIIUowkNDy00Hh41zKFlmpyFtmBja6DuA-CIn88"
      }
    
    var fullAddress: String {
        baseUrlOption + path + apiKey
    }
}
