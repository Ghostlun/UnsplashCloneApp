//
//  CollectionSearchModel.swift
//  UnsplashCloneApp
//
//  Created by Yoonha Kim on 5/13/21.
//

import Foundation

struct CollectionSearchModel: Decodable {
    var results: [CollectionResult]
}

struct CollectionResult: Decodable {
    var id: String
    var title: String
    var links: Links
    var coverPhoto: CoverPhoto
    
    enum CodingKeys: String, CodingKey {
        case id, title, links
        case coverPhoto = "cover_photo"
    }
}
