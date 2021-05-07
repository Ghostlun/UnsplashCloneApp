//
//  SplashDataModel.swift
//  UnsplashCloneApp
//
//  Created by Yoonha Kim on 5/5/21.
//

import Foundation

struct SplashModel: Decodable {
  
    var id: String
    var title: String
    var description: String?
    var updatedAt: String
    var curated: Bool
    var featured: Bool
    var totalPhotos: Int?
    var shareKey: String?
    var tags: [Tags]
    
    enum CodingKeys: String, CodingKey {
        case id, title, description, curated, tags, featured
        case updatedAt = "updated_at"
        case totalPhotos = "total_photos"
        case shareKey = "share_key"
    }
}

struct Tags: Decodable {
    var source: Source?
}

struct Source: Decodable {
    var title: String
    var subtitle: String
    var coverPhoto: CoverPhoto?
    var description: String
    
    enum CodingKeys: String, CodingKey {
        case title, subtitle, description
        case coverPhoto = "cover_photo"
    }
}

struct CoverPhoto: Decodable {
    var id: String
    var width: Int
    var height: Int
    var urls: URLAddress?
}

struct URLAddress: Decodable {
    var raw: String
    var full: String
    var regular: String
    var small: String
    var thumb: String
}

typealias SplashModels = [SplashModel]
