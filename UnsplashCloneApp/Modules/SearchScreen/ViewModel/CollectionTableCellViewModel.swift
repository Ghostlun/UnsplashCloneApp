//
//  CollectionTableCellViewModel.swift
//  UnsplashCloneApp
//
//  Created by Yoonha Kim on 5/13/21.
//
import Foundation

protocol CollectionTableCellViewModelProtocol {
    var imageTitle: String { get }
    var imageUrl: URL { get }
}

class CollectionTableCellViewModel: CollectionTableCellViewModelProtocol {
    
    let collectionResult: CollectionResult
    
    init(collectionResult: CollectionResult) {
        self.collectionResult = collectionResult
    }
    
    var imageTitle: String {
        collectionResult.title
    }
    
    var imageUrl: URL {
        guard let url = URL(string: collectionResult.coverPhoto.urls?.small ?? "https://www.w3schools.com/images/picture.jpg") else { fatalError("No Address") }
        return url
    }
}
