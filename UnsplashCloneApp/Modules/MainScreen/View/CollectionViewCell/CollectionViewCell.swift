//
//  CollectionViewCell.swift
//  UnsplashCloneApp
//
//  Created by Yoonha Kim on 5/7/21.
//

import UIKit

class CollectionViewCategoryCell: UICollectionViewCell, CellReusable {
    
    @IBOutlet private weak var categoryLabel: UILabel!
    
    func configure(data: String) {
        categoryLabel.text = data
    }
}
