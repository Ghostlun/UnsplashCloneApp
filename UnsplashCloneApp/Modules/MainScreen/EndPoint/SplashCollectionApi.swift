//
//  SplashCollectionApi Api.swift
//  UnsplashCloneApp
//
//  Created by Yoonha Kim on 5/10/21.
//

import Foundation

enum SplashCollectionApi: EndPoint {
    
    case searchByCategory(category: String)
    
//    https://api.unsplash.com/topics?page=1&id_or_slug=wallpapers&client_id=2e5zRIIUowkNDy00Hh41zKFlmpyFtmBja6DuA-CIn88
    
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
        "https://api.unsplash.com/topics?"
    }
    
    var path: String {
        switch self {
        case .searchByCategory(let category):
            return "page=\(1)&id_or_slug=\(category)"
        }
    }
    
    var apiKey: String {
          "&client_id=2e5zRIIUowkNDy00Hh41zKFlmpyFtmBja6DuA-CIn88"
      }
    
    var fullAddress: String {
        baseUrlOption + path + apiKey
    }
}
