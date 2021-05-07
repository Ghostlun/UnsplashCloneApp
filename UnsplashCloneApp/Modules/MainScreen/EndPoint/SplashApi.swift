//
//  SplashApi.swift
//  MapHomework
//
//  Created by Yoonha Kim on 4/27/21.
//

import Foundation

enum NetworkEnvironment {
    case normalSearch
}

enum SplashApi {
    case recommended
}

extension SplashApi: EndPointType {
    var environmentBaseURL: String {
        switch NetworkManager.environment {
        case .normalSearch:
            return "https://api.unsplash.com/collections/?client_id="
        }
    }
    
    var baseURL: URL {
        guard let url = URL(string: environmentBaseURL) else { fatalError("baseURL could not be configured.") }
        return url
    }
    
    var path: String {
        switch self {
        case .recommended:
            return ""
        }
    }
    
    var httpMethod: HTTPMethod {
         .get
    }
    
    var task: HTTPTask {
        switch self {
        default:
            return  .request
        }
    }

    var headers: HTTPHeaders? {
        nil
    }
    
    var apiKey: String {
        "2e5zRIIUowkNDy00Hh41zKFlmpyFtmBja6DuA-CIn88"
    }
    
    var fullAddress: String {
         environmentBaseURL + path + apiKey
    }
}

