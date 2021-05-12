//
//  LatestCollectionCellView.swift
//  UnsplashCloneApp
//
//  Created by Yoonha Kim on 5/11/21.
//

import UIKit

class LatestCollectionCellView: UICollectionViewCell, CellReusable {
    
    @IBOutlet private weak var latestImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var providerLabel: UILabel!
    
    func configure(_ configurator: CollectionCellViewModelProtocol) {
        latestImageView.sd_setImage(with: configurator.mainImageUrl)
        titleLabel.text = configurator.titleOfImage
        providerLabel.text = configurator.provider
    }
}
