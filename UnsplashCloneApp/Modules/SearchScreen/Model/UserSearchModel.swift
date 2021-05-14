//
//  UserSearchModel.swift
//  UnsplashCloneApp
//
//  Created by Yoonha Kim on 5/13/21.
//

import Foundation

struct UserSearchModel: Decodable {
    var results: [UserResult]
}

struct UserResult: Decodable {
    var id: String
    var username: String
    var name: String
    var links: Links
    var profileImage: ProfileImage
    
    enum CodingKeys: String, CodingKey {
        case id, username, name, links
        case profileImage = "profile_image"
    }}

struct ProfileImage: Decodable {
    var small: String
    var medium: String
    var large: String
}
