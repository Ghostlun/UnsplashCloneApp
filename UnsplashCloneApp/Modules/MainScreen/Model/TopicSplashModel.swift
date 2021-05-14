//
//  TopicSplashModel.swift
//  UnsplashCloneApp
//
//  Created by Yoonha Kim on 5/14/21.
//

import Foundation

struct TopicSplashModel: Decodable {
    
    var id: String?
    var createAt: String?
    var updatedAt: String?
    var description: String?
    var altDescription: String?
    var urls: URLAddress?
    var links: Links?
    var user: Users?
}

typealias TopicSplashModels = [TopicSplashModel]
