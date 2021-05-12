//
//  EndPoint+Ext.swift
//  MapHomework
//
//  Created by Yoonha Kim on 4/27/21.
//

import Foundation

protocol EndPoint {
    var baseURL: URL { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var task: HTTPTask { get }
    var headers: HTTPHeaders? { get }
    var fullAddress: String { get }
}

extension EndPoint {
    
    var baseURL: URL {
        guard let url = URL(string: "https://api.unsplash.com/collections/?client_id=") else {
            fatalError("baseURL could not be configured.") }
        return url
    }
    
    var httpMethod: HTTPMethod {
        .get
    }
    
    var headers: HTTPHeaders? {
        nil
    }
}
