//
//  HTTPTask.swift
//  MapHomework
//
//  Created by Yoonha Kim on 4/26/21.
//
// Checked

import Foundation

enum HTTPTask {
    // Request
    case request
    
    case requestParameters(bodyParameters: Parameters?,
        bodyEncoding: ParameterEncoding,
        urlParameters: Parameters?)
    
    case requestParametersAndHeaders(bodyParameters: Parameters?,
        bodyEncoding: ParameterEncoding,
        urlParameters: Parameters?,
        additionHeaders: HTTPHeaders?)
}
// HTTPHeaders
 typealias HTTPHeaders = [String: String]
