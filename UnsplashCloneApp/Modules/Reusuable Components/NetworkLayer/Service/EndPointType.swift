//
//  EndPointType.swift
//  MapHomework
//
//  Created by Yoonha Kim on 4/27/21.
//

import Foundation

protocol EndPointType {
    var baseURL: URL { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var task: HTTPTask { get }
    var headers: HTTPHeaders? { get }
    var fullAddress: String { get }
}
