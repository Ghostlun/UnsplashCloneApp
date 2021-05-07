//
//  AppError.swift
//  UnsplashCloneApp
//
//  Created by Yoonha Kim on 5/7/21.
//

import Foundation

enum AppError: Error {
    case invalidUrl
    case serverError
    case badResponse
    case noData
    case parseError
    case genericError(String)
    case badRequest
}
