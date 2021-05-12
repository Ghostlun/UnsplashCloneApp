//
//  SearchModel.swift
//  UnsplashCloneApp
//
//  Created by Yoonha Kim on 5/10/21.
//

import Foundation

struct SearchModel: Decodable {
    var total: Int
    var totalPages: Int
    var results: [PhotoResult]
    
    enum CodingKeys: String, CodingKey {
        case total, results
        case totalPages = "total_pages"
    }
}

struct PhotoResult: Decodable {
    var id: String?
    var createdAt: String?
    var updatedAt: String?
    var promotedAt: String?
    var width: Int
    var height: Int
    var description: String?
    
    var links: Links
    var urls: Urls
//    var user: Users
    
    enum CodingKeys: String, CodingKey {
        case id, width, height, links, urls
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case promotedAt = "promoted_at"
    }
}

struct Urls: Decodable {
    var raw: String?
    var full: String?
    var regular: String?
    var small: String?
    var thumb: String?
}

struct Links: Decodable {
    var html: String?
    var download: String?
    var downloadLocation: String?
    
    enum CodingKeys: String, CodingKey {
        case html, download
        case downloadLocation = "download_location"
    }
}
