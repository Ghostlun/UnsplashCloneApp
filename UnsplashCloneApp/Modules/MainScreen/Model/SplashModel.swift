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
    var featured: Bool
    var totalPhotos: Int?
    var shareKey: String?
    var links: Links
    var coverPhoto: CoverPhoto
    
    enum CodingKeys: String, CodingKey {
        case id, title, description, featured, links
        case updatedAt = "updated_at"
        case totalPhotos = "total_photos"
        case shareKey = "share_key"
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
