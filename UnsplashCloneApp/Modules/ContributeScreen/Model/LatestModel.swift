//
//  LatestModel.swift
//  UnsplashCloneApp
//
//  Created by Yoonha Kim on 5/11/21.
//

import Foundation

struct LatestModel: Decodable {
    var id: String?
    var urls: URLAddress?
    var links: Links?
    var user: Users?
    var description: String?
    var altDescription: String?
    
    enum CodingKeys: String, CodingKey {
        case id, urls, links, user, description
        case altDescription = "alt_description"
    }
}

struct Users: Decodable {
    var id: String?
    var username: String?
    var name: String?
    var firstName: String?
    var lastName: String?
    
    enum CodingKeys: String, CodingKey {
        case id, username, name
        case firstName = "first_name"
        case lastName = "last_name"
    }
}

typealias LatestModels = [LatestModel]
